<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 10/28/21
 * Time: 7:13 PM
 */

class Stats_model extends Model
{

    function __construct()
    {
        parent::__construct();
    }

    function index($user, $role) {

        $today = date("Y-m-d");
        $previous_date = date('Y-m-d', strtotime('-1 day', strtotime($today)));


        $this->db->where("CAST(date_modified AS DATE)", $previous_date, ">");
        $users = $this->db->getOne("users", "count(user) as today, (select count(user) from users) as users");

        if ($role != 2)
            $this->db->where("stories.user", $user);
        $this->db->where("deleted", 0);
        $this->db->where("CAST(date_modified AS DATE)", $previous_date, ">");
        $stories = $this->db->getOne("stories", "count(id) as today, (select count(id) from stories where deleted = 0) as stories");


        if ($role != 2)
            $this->db->where("comments.user", $user);
        $this->db->where("date_added", $previous_date, ">");
        $comments = $this->db->getOne("comments", "count(id) as today, (select count(id) from comments) as comments");

        if ($role != 2)
            $this->db->where("story_files.user", $user);

        $this->db->where("date_added", $previous_date, ">");
        $this->db->where("deleted", 0);
        $files = $this->db->getOne("story_files", "count(id) as today, (select count(id) from story_files where deleted = 0) as files");


        if ($role != 2)
            $this->db->where("comments.user", $user);
        //$this->db->where("deleted", 0);
        $this->db->orderBy("id", "desc");
        $this->db->join("users", "users.user = comments.user");
        $comments_data = $this->db->get("comments", 10, "id, comment, date_added, names, 
        (select url from stories where id = comments.story) as url, profile_pic");

        if ($role != 2)
            $this->db->where("stories.user", $user);
        $this->db->orderBy("id", "desc");
        $this->db->where("deleted", 0);
        $this->db->join("users", "users.user = stories.user");
        $stories_data = $this->db->get("stories", 10, "title, cast(stories.date_modified as date) as date_modified, names, 
        url, profile_pic");

        if ($role != 2)
            $this->db->where("story_files.user", $user);
        $this->db->where("deleted", 0);
        $this->db->orderBy("id", "desc");
        $this->db->join("users", "users.user = story_files.user");
        $media = $this->db->get("story_files", 10, "file_extension as ext, names, profile_pic, file_path, file_type, file_extension, caption, date_added");

        if ($role != 2)
            $this->db->where('auth.id', $user);

        $this->db->orderBy("names", "asc");
        $this->db->orderBy("role", "desc");
        $this->db->join("auth", "auth.id = users.user");
        $user_data = $this->db->get("users", 10,"names, role,
        user, email, username, nin, dob, address, auth.status, date_modified,
         (select count(id) from stories where stories.user = users.user) as stories, profile_pic, contacts, gender");

        return array("users" => $users,
            "story_stats" => $stories,
            "comment_stats" => $comments,
            "files_stats" => $files,
            "comments" => $comments_data,
            "stories_data" => $stories_data,
            "media" => $media,
            "user_data" => $user_data
            );
    }
}