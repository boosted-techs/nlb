<?php


class Accounts_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    function create_account($role, $user) {
        if ($role != 2)
            return "Invalid%20Permissions";
        $email = trim($this->inputs->post("email"));
        $names = $this->strings->remove_none_utf_char(trim($this->inputs->post("names")));
        $password = trim($this->inputs->post("password"));
        $location = trim($this->inputs->post("address"));
        $gender = trim($this->inputs->post("gender"));
        $dob = trim($this->inputs->post("dob"));
        $contacts = trim($this->inputs->post("contacts"));
        $role = trim($this->inputs->post("role"));
        $nin = trim($this->inputs->post("nin"));
        if (!preg_match("/^[a-zA-Z-' ]*$/",$names))
            return "Only%20letters%20and%20white%20space%20allowed";
        if ($this->is_email_exists($email))
            return "Email%20address%20either%20exists%20or%20is%20invalid.%20Try%20again%20with%20another%20email%20address";

        $age = date_diff(date_create($dob), date_create('now'))->y;
        if ($age < 18 or $age > 100)
            return "Invalid date of birth. Try again with correct date format";
        if (empty($password) or strlen($password) < 5)
            return "Password should be of 5 characters and above";
        $user_name = $this->check_url_for_duplicates(strtolower(explode(" ", $names)[0]), "auth", "username");
        //$token =  $this->password_hash($email.time().$user_name);
        $id = $this->db->insert("auth", array("email" => $email, "added_by" => $user, "password" => $this->password_hash($password), "status" => 1, "username" => $user_name, "role" => $role,  "date_added" => date("Y-m-d")));
        $this->db->insert("users", array("user" => $id, "contacts" => $contacts, "names" => $names, "address" => $location, "dob" => $dob, "gender" => $gender, "nin" => $nin));
        return array("email" => $email, "username" => $user_name, "names" => $names);
    }

    function update_account($role) {
        if ($role != 2)
            return "Invalid%20Permissions";

        $user = trim($this->inputs->post("user"));
        if(empty($user))
            return "An%20error%20occurred";

        $names = $this->strings->remove_none_utf_char(trim($this->inputs->post("names")));
        $password = trim($this->inputs->post("password"));
        $location = trim($this->inputs->post("address"));
        $gender = trim($this->inputs->post("gender"));
        $dob = trim($this->inputs->post("dob"));
        $contacts = trim($this->inputs->post("contacts"));
        $role = trim($this->inputs->post("role"));
        $nin = trim($this->inputs->post("nin"));

        if (!preg_match("/^[a-zA-Z-' ]*$/",$names))
            return "Only%20letters%20and%20white%20space%20allowed";

        $age = date_diff(date_create($dob), date_create('now'))->y;
        if ($age < 18 or $age > 100)
            return "Invalid%20date%20of%20birth.%20Try%20again%20with%20correct%20date%20format";

        $this->db->where("id", $user);
        $this->db->update("auth", array("role" => $role));

        $this->db->where("user", $user);
        $this->db->update("users", array("contacts" => $contacts, "names" => $names, "address" => $location, "dob" => $dob, "gender" => $gender, "nin" => $nin));
        return 1;
    }



    function is_email_exists($email) {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL))
           return true;

        $this->db->where("email", $email);
        return $this->db->getOne("auth", "id");
    }

    function check_url_for_duplicates($url, $table, $column) {
        $this->db->where($column,  $url);
        $this->db->orderBy($column, 'desc');

        $query = $this->db->get($table, null, array($column));
        if (empty($query))
            $url = $url;
        else{
            $url_string = explode("-", $url);
            $url_counter = end($url_string);
            if (is_numeric($url_counter))
                $url_counter++;
            else
                $url_counter = $url_counter."-1";
            array_pop($url_string);
            array_push($url_string, $url_counter);
            $url = implode("-", $url_string);
            $url = $this->check_url_for_duplicates($url, $table, $column);
        }
        return $url;
    }

    function get_accounts($role, $user) {
        if ($role != 2)
            $this->db->where('id', $user);
        $query = $this->inputs->get("q");

        $limit = null;
        if (isset($query)) {
            $this->db->where("names", "%" . $query . "%", "like");
            $limit = 10;
        }
        $this->db->orderBy("names", "asc");
        $this->db->orderBy("role", "desc");
        $this->db->join("auth", "auth.id = users.user");
        return $this->db->get("users", $limit,"names, role,
        user, email, username, nin, dob, address, auth.status, date_modified,
         (select count(id) from stories where stories.user = users.user) as stories, profile_pic, contacts, gender");
    }

    function get_account($role, $user, $username) {
        if ($role == 1)
            $this->db->where('id', $user);
        else
            $this->db->where('auth.username', $username);
        $this->db->orderBy("names", "asc");
        $this->db->orderBy("role", "desc");
        $this->db->join("auth", "auth.id = users.user");
        return $this->db->getOne("users", null,"names, role,
        user, email, username, nin, dob, address, auth.status, date_modified,
         (select count(id) from stories where stories.user = users.user) as stories, profile_pic, contacts, gender");
    }


    function toggle_state($role) {
        $special_categories = ['categories, users, auth'];
        $table = $this->security->xss_clean(trim($this->inputs->get("t")));
        $primary_key = $this->security->xss_clean(trim($this->inputs->get("p")));
        $column = $this->security->xss_clean(trim($this->inputs->get("c")));
        if (in_array($table, $special_categories) and $role != 1)
            return "Wrong%20permissions";

        $state = $this->inputs->get("s");
        $id = $this->inputs->get("i");

        if (! is_numeric($id) or ! is_numeric($state))
            return "Wrong%20data%20supplied";
        $state = $state == 2 ? 2 : 1;

        $this->db->where($primary_key, $id);
        return $this->db->update($table, array($column => $state));
    }

    function update_column_data($role) {
        $special_categories = ['categories, users, auth'];
        $table = $this->security->xss_clean(trim($this->inputs->get("t")));
        $primary_key = $this->security->xss_clean(trim($this->inputs->get("p")));
        $column = $this->security->xss_clean(trim($this->inputs->get("c")));
        if (in_array($table, $special_categories) and $role != 1)
            return "Wrong%20permissions";

        $data = $this->security->xss_clean(trim($this->inputs->post("s")));
        echo $data;
        if (empty($data))
            return "Empty%20content";

        if (strcmp($table, 'categories') == 0)
            $data = strtoupper($data);

        $id = $this->inputs->get("i");
        if (! is_numeric($id))
            return "Wrong data supplied";
        $this->db->where($primary_key, $id);
        return $this->db->update($table, array($column => $data));
    }

    function update_password($user) {
        /*
        Old password
        */
        $password = $this->inputs->post("old-pwd");
        /*
         * New password
         */
        $new_password = $this->inputs->post("new-pwd");
        /*
         * Validate users old password
         */
        $this->db->where("id", $user);
        $this->db->where("password", $this->password_hash($password));
        $id = $this->db->getValue("auth", "id");
        if (! $id)
            return "Old%20password%20is%20wrong";

        $this->db->where("id", $user);
        $this->db->update("auth", array("password" => $this->password_hash($new_password)));
        return 1;
    }

    function reset_password($user, $role) {
        if ($role != 2)
            return "Restricted%20feature";

        $password = $this->password_hash(time());
        $password = substr($password, 0, 6);
        if (! is_numeric($user))
            return "Invalid%20input";

        $this->db->where("id", $user);
        $this->db->update("auth", array("password" => $this->password_hash($password)));
        return $password;
    }
}