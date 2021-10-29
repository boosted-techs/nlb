<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-08-22
 * Time: 22:51
 */

class Api extends Controller
{
    //Code from MVC

   function __construct()
   {
       parent::__construct();
       $this->model("Auth_model");
   }


}