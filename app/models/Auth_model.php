<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-07-31
 * Time: 13:50
 */

class Auth_model extends Model{
    function __construct()
    {
        parent::__construct();
    }

    public $security_key;
    function verify_user($email, $password) {
        $this->db->where("(email = ? or username = ?)", array($email, $email));
        $this->db->where("password", $this->password_hash($password));
        $data = $this->db->getOne("auth", "id") ?? false;
        if ($data) {
            //$this->save_logs($data['id'], "Logged in system");
            $this->session->set_user_data("user", $data['id']);
        }
        return $data ? true : false;
    }

    function delete_session() {
        $this->session->destroy();
        $this->cookie->destroy();
    }

    function is_logged_in() {
        return empty($this->session->data("user")) ? false : $this->session->data("user");
    }

    function get_user($user) {
        $this->db->where('id', $user);
        $this->db->join("auth", "auth.id = users.user");
        return $this->db->getOne("users", "names, role,
        user, email, username, nin, dob, address, auth.status, date_modified,
         (select count(id) from stories where stories.user = users.user) as stories, profile_pic, contacts, gender");
    }
}