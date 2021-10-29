<?php
/**
 * Redis
 * @category  NoSql
 * Work well with Redis class installed either from PHP-REDIS or any other redis class
 */

class Redis_cli{
    const HANDLER = 'redis';
    const GET_HANDLER = "GET";
    const  SET_HANDLER = "SET";
    private $redis;

    public function __construct() {
        /*
        * Access the redis configuration file from the Database settings file
        * ../config/database.config
        */
        global $redis_configuration;
        /*
         * Initiate the redis class
         */
        $this->redis = new Redis();
        /*
         * Make a connection to the database
         */
        $redis_configuration['is_persistent_connection'] == false ? $this->redis->connect($redis_configuration['host'], $redis_configuration['port'])
            :
            $this->redis->pconnect($redis_configuration['host'], $redis_configuration['port']);
        /*
         * Pass the redis user and password as an associative array
         */
        $this->redis->auth($redis_configuration['auth']);
        /*
         * Set the Redis session handler
         */
        ini_set('session.save_handler', self::HANDLER);
    }

    public function get_Key_value($key) {
        return $this->redis->get($key);
    }

    public function check_key_value($key) {
        return $this->redis->exists($key);
    }



    public function set_key_value($key, $value ) {
        $value =  $this->redis->set($key, $value);
        return $value;
    }

    public function close() {
        $this->redis->close();
    }

    public function ping($string= "") {
       return  $this->redis->ping();
    }

    function acl($string) {
        /*
         *  In order to user the ACL command you must be communicating with Redis >= 6.0 and
         *  be logged into an account that has access to administration commands such as ACL.
         * Please reference this tutorial for an overview of Redis 6 ACLs and the redis command
         *  reference for every ACL subcommand.
         */
        return $this->redis->acl($string);
    }

    function bg_rewrite_AOF() {
        /*
         * Start the background rewrite of AOF (Append-Only File)
         */
        return $this->redis->bgRewriteAOF();
    }


    function big_save() {
        /*
         * Asynchronously save the dataset to disk (in background)
         */
        return $this->redis->bgSave();
    }

    function set_config($string_key, $string) {
        return $this->redis->config(self::SET_HANDLER, $string_key, $string);
    }

    function get_config($string_key, $string) {
        return $this->redis->config(self::GET_HANDLER, $string_key, $string);
    }


    public function create_set($key, $value, $time_in_minutes = false ) {
        if ($time_in_minutes)
            $this->key_life_expectancy($key, $time_in_minutes);
        return $this->redis->set($key, $value);
    }

    private function key_life_expectancy($key, $minutes) {
        $seconds = $minutes * 60;
        $this->redis->expire($key, $seconds);
    }

    public function insert_key_hash($hash_name, $key, $value) {
        return $this->redis->hSetNx($hash_name, $key, $value);
    }

    public function replace_hash($hash_name, $key, $value) {
        return ($this->redis->hExists($hash_name, $key)) ?
            $this->redis->hSet($hash_name, $key, $value)
        : false;
    }

    public function create_hash($hash_name, $data) {
        $this->redis->del($hash_name);
        foreach($data as $key => $value)
        {
            $this->redis->hSet($hash_name, $key, $value);
        }
    }

    public function get_hash_json($hash_name) {
        header( 'Content-Type: application/json; charset=utf-8' );
        return json_encode($this->redis->hGetAll($hash_name),  TRUE | JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }

    public function get_hash($hash_name) {
        return $this->redis->hGetAll($hash_name);
    }

    public function get_hash_value($hash_name, $key) {
        return $this->redis->hGet($hash_name, $key);
    }

    public function insert_list($list_name, $value) {
        $this->redis->lpush($list_name, $value);
    }

    public function count_list($list_name) {
        return $this->redis->llen($list_name);
    }

    public function remove_list($list_name) {
        $this->redis->lRem($list_name, 'A', 2);
    }

    public function get_list_json($list_name) {
        header( 'Content-Type: application/json; charset=utf-8' );
        return json_encode($this->redis->lrange($list_name, 0, -1),TRUE | JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT );
    }

    public function get_list($list_name) {
        return $this->redis->lrange($list_name, 0, -1);
    }

    /*
    * save hashes to list while mapping each value in list to key in hash.
    * builds a document like structure for data storage like firebase and mongodb
    */
    public function insert_hash_list($hash_id, $key, $value, $list) {
        $this->redis->insertHash($hash_id, $key, $value);
        $this->redis->insertlist($list, $hash_id);
    }

    public function get_hash_list($list) {
        $all = $this->redis->getlist($list);
        foreach ($all as $c){
            return $this->redis->gethashjson($c);
        }
    }

    /*
    * streams : using redis for queueing and messaging
    * add to stream
    */
    public function stream_add($data, $stream_name) {
        $this->redis->xAdd($stream_name, "*" , $data); #data is an array
    }
}