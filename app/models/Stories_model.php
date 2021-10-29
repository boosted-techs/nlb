<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 10/28/21
 * Time: 3:12 AM
 */

class Stories_model extends Model
{
    function __construct()
    {
        parent::__construct();
        $this->model("Accounts_model");
    }

    function add_category($user, $role) {
        if ($role != 2)
            return "Invalid%20permissions";

        $category = trim($this->inputs->post("category"));
        if (empty($category))
            return "No input was supplied";
        $category = strtoupper($category);
        $e = $this->db->insert("categories", array("category" => $category, "user" => $user, "date_added" => date("Y-m-d")));
        return is_numeric($e) ? 1 : "Duplicate record in data set";
    }

    function get_categories() {
        $this->db->orderBy("category", "asc");
        return $this->db->get("categories", null, "id, category, status, user, date_added, (select count(id) from stories where category = categories.id and deleted = 0) as stories");
    }

    function save_story($user) {
       $story = trim($this->inputs->post("story"));
       $title = $this->inputs->post("title");

       $category = $this->inputs->post("category");

       if (! is_numeric($category))
           return "Provide category";

       if(empty($story))
           return "Provide story";

       if (empty($title))
           return "Title is empty";

       $url = strtolower($this->model->Accounts_model->check_url_for_duplicates($this->strings->replace_multiple_spaces($this->strings->remove_none_utf_char($this->strings->remove_special_chars($title))), "stories", 'url'));
       $this->db->insert("stories", array("story" => $story, "user" => $user, "category" => $category, "title" => $title, "url" => $url));
       return array("url" => $url);
    }

    function add_files($file_name, $user, $caption, $extension, $file_type) {
        return $this->db->insert("story_files", array("caption" => $caption, 'date_added' => date("Y-m-d"),
            "file_path" => $file_name, "file_type" => $file_type, "file_extension" => $extension, "user" => $user));
    }

    function get_stories($user = false) {
        if ($user)
            $this->db->where("stories.user", $user);
        $query = $this->inputs->get("q");

        $limit = null;
        if (isset($query)) {
            $this->db->where("title", "%" . $query . "%", "like");
            $limit = 30;
        }

        $category = $this->inputs->get("cat");
        if ($category and is_numeric($category))
            $this->db->where("category", $category);

        $this->db->where("deleted", 0);
        $this->db->orderBy("stories.id", "desc");
        $this->db->join("users", "users.user = stories.user");
        return $this->db->get("stories", $limit, "profile_pic, names, (select category from categories where id = stories.category) as category, contacts, (select username from auth where auth.id = stories.user) as username, stories.status, stories.deleted, stories.date_modified, title, url, stories.id");
    }

    function get_user_files($user) {
        $this->db->where("user", $user);
        $this->db->where("deleted", 0);
        $this->db->orderBy("id", "desc");
        return $this->db->get("story_files", null, array("id, caption, date_added, file_extension as ext, file_path, file_type, date_added"));
    }

    function get_story($url) {
        $this->db->where("stories.url", $url);
        $this->db->where("deleted", 0);
        $this->db->orderBy("stories.id", "desc");
        $this->db->join("users", "users.user = stories.user");
        return $this->db->getOne("stories", "stories.user, story, profile_pic, names, (select category from categories where id = stories.category) as category, contacts, (select username from auth where auth.id = stories.user) as username, stories.status, stories.deleted, stories.date_modified, title, url, stories.id, stories.category as cat");
    }

    function update_story($user, $role) {
        $story = trim($this->inputs->post("story"));
        $title = $this->inputs->post("title");

        $category = $this->inputs->post("category");

        if (! is_numeric($category))
            return "Provide category";

        if(empty($story))
            return "Provide story";

        if (empty($title))
            return "Title is empty";
        $id = $this->inputs->post("id");
        if (! is_numeric($id))
            return "invalid request";

        $this->db->where("id", $id);
        $data = $this->db->getOne("stories", "story, url, category, story, user, category, title, id");

        if ($role != 2)
            if ($data['user'] != $user)
                return "Forbidden action";

        $this->db->insert("story_update_logs", array("story" => $data['story'],
            "editor" => $user, "date_added" => date("Y-m-d"), "category" => $data['category'], "title" => $data['title'], "story_id" => $data['id']));

        $this->db->where("id", $id);
        $this->db->update("stories", array("story" => $story, "category" => $category, "title" => $title));
        return array("url" => $data['url']);
    }

    function story_changes($id) {
        $this->db->where("story_id", $id);
        $this->db->orderBy("story_update_logs.id", "desc");
        $this->db->join("users", "users.user = story_update_logs.editor");
        return $this->db->get("story_update_logs",null, "date_added, story_update_logs.editor, profile_pic, names, (select category from categories where id = story_update_logs.category) as category, contacts, (select username from auth where auth.id = story_update_logs.editor) as username, title, story_update_logs.id");
    }

    function get_story_edit($id) {
        $this->db->where("story_update_logs.id", $id);
        $this->db->orderBy("story_update_logs.id", "desc");
        $this->db->join("users", "users.user = story_update_logs.editor");
        return $this->db->getOne("story_update_logs","story, date_added, story_update_logs.editor, profile_pic, names, (select category from categories where id = story_update_logs.category) as category, contacts, (select username from auth where auth.id = story_update_logs.editor) as username, title, story_update_logs.id, story_update_logs.category as cat");
    }

    function add_comment($user) {
        //print_r($_POST);
        $comment = trim($this->inputs->post("comments"));
        if (empty($comment))
            return "Cannot post empty comment";
        $id = trim($this->inputs->post("id"));
        if (! is_numeric($id))
            return "Invalid input";
        return $this->db->insert("comments", array("story" => $id, 'date_added' => date("Y-m-d"), "comment" => $comment, "user" => $user));
         //echo $this->db->getLastError();
         //die();
    }

    function get_comments($id) {
        $this->db->where("story", $id);
        $this->db->orderBy("comments.id", "desc");
        $this->db->join("users", "users.user = comments.user");
        return $this->db->get("comments", null, array("(select username from auth where id = comments.user) as username, comments.id, comment, date_added, names, profile_pic"));
    }

    function get_media($user, $role) {
        if ($role != 2)
            $this->db->where("story_files.user", $user);

        $query = $this->inputs->get("q");

        $limit = null;
        if (isset($query)) {
            $this->db->where("caption", "%" . $query . "%", "like");
            $limit = 10;
        }

        $this->db->where("deleted", 0);
        $this->db->orderBy("id", "desc");
        $this->db->join("users", "users.user = story_files.user");
        return $this->db->get("story_files", $limit, "file_extension as ext, (select username from auth where id = users.user) as username, names, profile_pic, file_path, file_type, file_extension, caption, date_added");
    }

    function get_all_comments($user, $role) {
        if ($role != 2)
            $this->db->where("comments.user", $user);
        //$this->db->where("deleted", 0);
        $query = $this->inputs->get("q");

        $limit = null;
        if (isset($query)) {
            $this->db->where("comment", "%" . $query . "%", "like");
            $limit = 10;
        }
        $this->db->orderBy("id", "desc");
        $this->db->join("users", "users.user = comments.user");
        return $this->db->get("comments", $limit, "id, comment, date_added, names, 
        (select url from stories where id = comments.story) as url, profile_pic");
    }

}