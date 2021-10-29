<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 7/19/21
 * Time: 12:07 PM
 */

class Security
{
    public function __construct()
    {
    }
    function xss_clean($string) {
        /*
         * Clean string from html tags
         */
        $string = strip_tags($string);
        /*
         * Return cleaned string
         */
        filter_var($string, FILTER_SANITIZE_STRING);
        return $string;
    }

    function validate_email($email) {
        /*
        *
         * Remove all illegal characters from email
        */
        $email = filter_var($email, FILTER_SANITIZE_EMAIL);

        /*
         * Validate email
         */
        return (! filter_var($email, FILTER_VALIDATE_EMAIL) === false) ? true : false;
    }

    function validate_ip_address($ip) {
        return (!filter_var($ip, FILTER_VALIDATE_IP) === false) ? true : false;
    }

    function validate_url($url) {
        $url = filter_var($url, FILTER_SANITIZE_URL);
        return (!filter_var($url, FILTER_VALIDATE_URL) === false) ? true : false;
    }
}