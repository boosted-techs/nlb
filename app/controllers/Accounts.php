<?php


class Accounts extends Controller
{
    function __construct() {
        parent::__construct();
        $this->model("Auth_model");
        $this->controller("Auth");
        $this->model("Accounts_model");
        $this->model("Mail_model");
    }

    function index() {

    }

    function new_account() {
        $is_logged = $this->controller->Auth->logged_in();
       if ($is_logged)
           $this->redirect("../home");
        $this->smarty->display("search/index.tpl");
    }

    function create_account() {
        $is_logged = $this->controller->Auth->logged_in();
        $response = $this->model->Accounts_model->create_account();
        if (is_array($response)) {
            $subject = "Account verification";
            $message = "Hello " . $response['names'] . ", You are welcome to Paullah. Connect up with billions of users";
            $message .= "<br/>Your account has been created and click here to activate it.";
            $message .= "<a href='//" . $this->server->server_name . "/verify-account/" . $response['token'] . "/" . $response ['username'] ."'>ACTIVATE ACCOUNT</a>";
            $this->model->Mail_model->send_mail($response['email'], $message, $subject);
            $response = " your account has created. Check your email " . $response['email'] . " to verify it.";
        }
        echo json_encode($response);
    }

}