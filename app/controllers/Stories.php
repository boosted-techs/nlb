<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 10/28/21
 * Time: 3:11 AM
 */

class Stories extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->controller("Auth");
        $this->model("Auth_model");
        $this->model("Stories_model");
        $this->model("Accounts_model");
    }

    function index() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $this->smarty->assign("user", $user);
        $this->smarty->assign("stories", $this->model->Stories_model->get_stories());
        $this->smarty->display("dashboard/stories/index.tpl");
    }

    function add_category() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $response = $this->model->Stories_model->add_category($user['user'], $user['role']);
        if ($response != 1)
            $this->redirect("../app/categories?error=" . $response);
        else
            $this->redirect("../app/categories?success=Category successfully updated.");
    }

    function categories() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $this->smarty->assign("user", $user);
        $this->smarty->assign("categories", $this->model->Stories_model->get_categories());
        $this->smarty->display("dashboard/stories/categories.tpl");
    }

    function new_story() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $this->smarty->assign("user", $user);
        $this->smarty->assign("categories", $this->model->Stories_model->get_categories());
        $this->smarty->display("dashboard/stories/add-story.tpl");
    }

    function save_story() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $this->smarty->assign("user", $user);
        $r = $this->model->Stories_model->save_story($user['user']);
        if (is_array($r))
            $this->redirect("//" . $this->server->server_name . "/story/" . $r['url']);
        else
            $this->redirect("//" . $this->server->server_name . "/new-story?error=" . $r);
    }

    function upload_files() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $alt_text = $this->security->xss_clean(trim($this->inputs->post("alt")));
        $file_name = $_FILES['fileToUpload']['name'];
        $tmp_file = $_FILES['fileToUpload']['tmp_name'];
        $extension = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
        $accepted_types = array("png", "jpg", "jpeg", "gif", "webp", 'mp4', 'mpeg', 'aac', 'wav', 'mp3', 'avi', 'pdf', 'docx', 'pptx');
        if (! is_executable($tmp_file)) {
            if (in_array($extension, $accepted_types)) {
                $image_name = hash('md5', time() . rand(0, 2000)) . "_nlb." . $extension;
                $image_path = "files/" . $image_name;
                //                if (is_dir("media/products_thumbnails/"))
                //                    echo 1;
                if (move_uploaded_file($tmp_file, $image_path)) {
                    if (in_array($extension, ['png', 'jpg', 'jpeg', 'gif', 'webp']))
                        /*
                         * Specifying images
                         */
                        $file_type = 1; //Image files
                    elseif (in_array($extension, ['mp4', 'avi', 'mpeg']))
                        /*
                         * Specifying file type to be saved to the database.. These are videos
                         */
                        $file_type = 2; //Video files
                    elseif (in_array($extension, ['mp4', 'acc', 'wav', 'gif', 'webp']))
                        /*
                         * For audio files
                         */
                        $file_type = 3;
                    else
                        $file_type = 4;

                    $this->model->Stories_model->add_files($image_name, $user['user'], $alt_text, $extension, $file_type);
                }
                echo json_encode(array("success" => true, "file" => "//" . $this->server->server_name . "/files/" . $image_name));
            }
            else
                echo json_encode(null);
        }
        else
            echo json_encode(null);
    }

    function story($url) {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);

        $story = $this->model->Stories_model->get_story($url);
        $this->smarty->assign("user", $user);
        $this->smarty->assign("categories", $this->model->Stories_model->get_categories());
        $this->smarty->assign("edits", $this->model->Stories_model->story_changes($story['id']));
        $this->smarty->assign("story", $story);
        $this->smarty->assign("comments", $this->model->Stories_model->get_comments($story['id']));
        $this->smarty->display("dashboard/stories/story.tpl");
    }

    function update_story() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $this->smarty->assign("user", $user);
        $r = $this->model->Stories_model->update_story($user['user'], $user['role']);
        if (is_array($r))
            $this->redirect("//" . $this->server->server_name . "/story/" . $r['url']);
        else
            $this->redirect("//" . $this->server->server_name . "/new-story?error=" . $r);
    }

    function edits($story) {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);

        $story = $this->model->Stories_model->get_story_edit($story);
        $this->smarty->assign("user", $user);
        $this->smarty->assign("categories", $this->model->Stories_model->get_categories());
        $this->smarty->assign("story", $story);
        $this->smarty->display("dashboard/stories/story-edit.tpl");
    }

    function add_comment() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);

        $i = $this->model->Stories_model->add_comment($user['user']);
        if (is_numeric($i))
            $this->redirect("//" . $this->server->server_name . "/story/" . $this->inputs->get('url') . "?success=Comment successfully added");
        else
            $this->redirect("//" . $this->server->server_name . "/story/" . $this->inputs->get('url') . "?error=" . $i);

    }

    function media() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $this->smarty->assign("user", $user);
        $this->smarty->assign("media", $this->model->Stories_model->get_media($user['user'], $user['role']));
        $this->smarty->display("dashboard/stories/media.tpl");
    }

    function comments() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $this->smarty->assign("user", $user);
        $this->smarty->assign("comments", $this->model->Stories_model->get_all_comments($user['user'], $user['role']));
        $this->smarty->display("dashboard/stories/comments.tpl");
    }

    function search() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);

        $this->smarty->assign("stories", $this->model->Stories_model->get_stories());
        $this->smarty->assign("accounts", $this->model->Accounts_model->get_accounts($user['role'], $user['user']));
        $this->smarty->assign("comments", $this->model->Stories_model->get_all_comments($user['user'], $user['role']));
        $this->smarty->assign("user", $user);
        $this->smarty->assign("media", $this->model->Stories_model->get_media($user['user'], $user['role']));
        $this->smarty->display("dashboard/search.tpl");
    }
}