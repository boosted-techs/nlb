<?php
/**
 * Created by PhpStorm.
 * User: Ashiraff Tumusiime
 * Company: Boosted Technologies LTD
 * Date: 7/19/21
 * Time: 9:28 AM
 */

class Controller {
    /*
     *
     * Smarty class
     *
    */
    public $smarty;
    /*
     *
     * Used to load classes
     *
    */
    public $load;
    /*
     *
     * Input class object
     *
    */
    public $inputs;
    /*
     * Server Class object
     *
    */
    public $server;
    /*
     *
     * Cookie object
     *
    */
    public $cookie;
    /*
     *
     * Session class object
     *
    */
    public $session;
    /*
     *
     * Mail class object
     *
    */
    public $mail;
    /*
     *
     * Model class object
     *
    */
    public $model = [];
    /*
     *
     * Helper class Object
     *
    */
    public $library = [];
    /*
     *
     * Helper
     *
    */
    public $helper;
    /*
     *
     * Controller class object
     *
    */
    public $controller = [];
    /*
     *
     * Redis class Object
     *
    */
    public $redis_cli;
    /*
     * Helpers object
     */

    private $helpers = [];

    /*
     * Security helper
     */
    public $security;
    /*
     * Strings helper
     */
    public $strings;

    function __construct() {
        /*
         *
         Loading smarty
        */
        $smarty = new Smarty();
        $smarty->setTemplateDir(APP_PATH.'views/templates')
            ->setCompileDir(APP_PATH.'views/templates_c')
            ->setCacheDir(APP_PATH.'views/cache');
        $this->smarty = $smarty;

        /*
         * Inputs
         */
        $this->inputs = new Input();
        /*
         * Server class
         */
        $this->server = new Server();
        /*
         * Cookies class
         */
        $this->cookie = new Cookies();
        /*
         * Session class
         */
        $this->session = new Session();
        /*
         * Mail class
         */
        $this->mail = new Mail();
        /*
         * Security class
         */
        $this->security = new Security();
        /*
         * Strings class
         */
        $this->strings = new String_helper();

        $this->helper = new stdClass();
        $this->model = new stdClass();
        $this->library = new stdClass();
        $this->controller = new stdClass();
    }

    function model($class) {
        /*
         * Include and load the model classes
         * These are classes that interact with the Mysql Dal Class
         */
        include_once(APP_PATH . "models/" . $class . ".php");
        /*
         * If the class exists, create an instance of it
         */
        if (class_exists($class, true))
            $this->model->$class = new $class;
        else
            return false;
    }

    function _load_helpers() {
        /*
         * Include the helper classes from the helper library
         */
        $path = APP_PATH . "/helpers";
        $helpers = glob($path . "*.php");

    }


    function redirect($url, $header = false) {
        /*
         * Lets manage redirects
         */
        ! $header ? header("location:" . $url) : header("location:" . $url, true, $header);
        exit;
    }

    function set_headers($header, $header_value) {
        /*
         * Set Headers
         */
        header($header . ":" . $header_value);
    }

    function controller($class) {
        /*
         * Include classes from controller folder
         * ie ../app/controllers/
         *
         * By default controllers are called when they are needed
         */
        include_once(APP_PATH . "controllers/" . $class . ".php");
        /*
         * If class exists, a class instance is created
         */
        if (class_exists($class, true))
            $this->controller->$class = new $class;
        else
            return false;
    }

    function class_load_error($error) {
        $smarty = $this->smarty();
        $smarty->assign("error", $error);
        $smarty->display("./error/error.tpl");
    }
}