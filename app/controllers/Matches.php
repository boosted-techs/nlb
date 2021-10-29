<?php


class Matches extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Auth_model");
        $this->controller("Auth");
    }

    function search() {
//        $location = $this->input->post("location");
//        $interests = $this->input->post("interests");
//        $lower_age = $this->input->post("lowerAge");
//        $upper_age = $this->input->post("upperAge");
        $is_logged = $this->controller->Auth->logged_in();
        $this->session->set_user_data("matchQuery", $this->input->post());
        if ($is_logged)
            echo json_encode("search");
        else
            echo json_encode("create-account");
    }

}