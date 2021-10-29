<?php
class Media extends Controller {
    function __construct() {
        parent::__construct();
        $this->controller("Auth");
        $this->model("Adverts_model");
        $this->model("Auth_model");
        $this->model("Accounts_model");
        $this->model("Media_model");
    }

    function get_media_updates() {
        if (! $this->model->Auth_model->is_logged_in())
            return false;
        $images  = $this->model->Media_model->get_latest_media();
        echo json_encode($images);
    }
}