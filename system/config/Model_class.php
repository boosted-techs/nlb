<?php
/**
 * Created by PhpStorm.
 * User: Ashiraff
 * Company: Boosted Technologies LTD
 * Date: 7/19/21
 * Time: 9:29 AM
 */

class Model extends Controller {
    public $db;
    public $redis;
    function __construct(){
        parent::__construct();
        //Db config
        global $database_config;
        $this->db = new MysqliDb($database_config['host'], $database_config['username'], $database_config['password'], $database_config['database']);
    }

    public function password_hash($string) {
        return hash('sha256', $string);
    }
}