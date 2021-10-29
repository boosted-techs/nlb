<?php
/**
 * Created by PhpStorm.
 * User: Ashiraff
 * Company: Boosted Technologies
 * Date: 7/19/21
 * Time: 9:51 AM
 */

class Cookies  {
    public $cookie;
    function __construct()
    {
        //parent::__construct();
        $this->cookie = (object)$this->get_cookie();
    }

    private function get_cookie() {
        return $_COOKIE;
    }
    function set($cookie_name, $cookie_data, $expiry = (86400 * 30 * 3), $path = "/", $domain = "", $secure = false, $http_only = false) {
        setcookie($cookie_name, $cookie_data, time() + $expiry, $path, $domain, $secure, $http_only);
    }

    function read($cookie_name = false) {
        if (isset($cookie_name))
            if (isset($_COOKIE[$cookie_name]))
                return $_COOKIE[$cookie_name];
            else
                return false;
        return $_COOKIE;

    }

    function destroy($cookie = false) {
        if ($cookie)
            setcookie( $cookie, "", time()- 60, "/","", 0);
        else {
            if (isset($_SERVER['HTTP_COOKIE'])) {
                $cookies = explode(';', $_SERVER['HTTP_COOKIE']);
                foreach($cookies as $cookie) {
                    $parts = explode('=', $cookie);
                    $name = trim($parts[0]);
                    setcookie($name, '', time()-1000);
                    setcookie($name, '', time()-1000, '/');
                }
            }
        }
    }
}