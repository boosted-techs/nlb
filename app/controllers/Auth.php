<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-07-31
 * Time: 09:17
 */
class Auth extends Controller
{
    function __construct() {
        parent::__construct();
        $this->model("Mail_model");
        $this->model("Auth_model");
        $this->model("Accounts_model");
   }

    function index() {
       if (isset($this->session->data->user))
           $this->redirect("//" . $this->server->server_name . "/app");
        $this->session->set_user_data("account_creation", time());
        $this->smarty->display("login/index.tpl");
    }

    function sign_out() {
        $this->cookie->destroy();
        $this->session->destroy();
        $this->redirect("//" . $this->server->server_name);
    }

    function logged_in() {
        $user = $this->model->Auth_model->is_logged_in();
        if ($user) {
            $user = $this->model->Auth_model->get_user($user);
        }
        return $user;
    }

    function change_passwords() {
        //echo json_encode(false);
        //print_r($this->inputs->post());

            if (strcmp($this->inputs->post("password"), $this->inputs->post("password2")) == 0) {
                $this->model("Staff_model");
                if ($this->model->Staff_model->update_user_password($this->inputs->post("uid"))) {
                    $this->model->Auth_model->update_token($this->inputs->post("uid"), $this->inputs->post("token"));
                    echo true;
                }
                else
                    echo false;
            }else
                echo false;
    }
    function login()
    {
       //print_r($this->inputs->post(''));
       //echo hash("sha256", "ashan");
        echo json_encode($this->model->Auth_model->verify_user(strtolower($this->inputs->post("email")), $this->inputs->post("password")));

    }
}