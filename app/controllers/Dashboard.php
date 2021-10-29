<?php


class Dashboard extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->controller("Auth");
        $this->model("Auth_model");
        $this->model("Accounts_model");
        $this->model("Stories_model");
        $this->model("Stats_model");
    }

    function index($user = false) {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
          $this->redirect("../");
        $this->smarty->assign("user", $user);
        $this->smarty->assign("stats", $this->model->Stats_model->index($user['user'], $user['role']));
        $this->smarty->display("dashboard/index.tpl");
    }

    function get_latest_users() {
        if (! $this->model->Auth_model->is_logged_in())
            return false;
        $is_logged = $this->controller->Auth->logged_in();
        $response = $this->model->Accounts_model->get_accounts($is_logged['id']);
        echo json_encode($response);
    }

    function users() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("../");
        $this->smarty->assign("user", $user);
        $accounts = $this->model->Accounts_model->get_accounts($user['role'], $user['user']);
        $this->smarty->assign("accounts", $accounts);
        $this->smarty->display("dashboard/users/users.tpl");
    }

    function user($username) {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);

        $this->smarty->assign("stories", $this->model->Stories_model->get_stories($user['user']));
        $this->smarty->assign("user", $user);
        $accounts = $this->model->Accounts_model->get_account($user['role'], $user['user'], $username);
        $this->smarty->assign("account", $accounts);
        $this->smarty->assign("files", $this->model->Stories_model->get_user_files($user['user']));
        $this->smarty->display("dashboard/users/user.tpl");
    }

    function create_account() {
        //print_r($this->inputs->post());
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $i = $this->model->Accounts_model->create_account($user['role'], $user['user']);
        if (! is_array($i))
            $this->redirect("../app/users?error=" . $i);
        else
            $this->redirect("../app/users?success=Account successfully created.");
    }

    function update_account() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $i = $this->model->Accounts_model->update_account($user['role']);

        if ($i != 1)
            $this->redirect("../app/users?error=" . $i);
        else
            $this->redirect("../app/users?success=Account successfully updated.");
    }

    function toggle_state() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $this->model->Accounts_model->toggle_state($user['role']);
        $this->redirect($this->server->http_refer);
    }

    function update_content() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $this->model->Accounts_model->update_column_data($user['role']);
        $this->redirect($this->server->http_refer);
    }

    function change_password() {
        $user = $this->controller->Auth->logged_in();
        if (! $user)
            $this->redirect("//" . $this->server->server_name);
        $r = $this->model->Accounts_model->update_password($user['user']);
        if ($r != 1)
            $this->redirect("../app?error=" . $r);
        else
            $this->redirect("../app?success=Password successfully updated.");
    }

    function reset_password($user) {
        $admin = $this->controller->Auth->logged_in();
        if (! $admin)
            $this->redirect("//" . $this->server->server_name);
        $r = $this->model->Accounts_model->reset_password($user, $admin['role']);
        if (strlen($r) == 6)
            $this->redirect("//" . $this->server->server_name . "/app/users?password=" . $r . "&success=Account%20password%20successfully%20updated");
        else
            $this->redirect("//" . $this->server->server_name . "/app/users?error=" . $r);
    }

}