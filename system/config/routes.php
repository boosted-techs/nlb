<?php

//Less define our simple routes in this file to help us map to the exact methods in our project

$route['']                                  =               "Auth/index";

$route['add-comment']                       =               "Stories/add_comment";
$route['app']                               =               "Dashboard/index";
$route['login']                             =               "Auth/login";
$route['app/activate']                      =               "Dashboard/toggle_state";
$route['app/add-account']                   =               "Dashboard/create_account";
$route['app/add-category']                  =               "Stories/add_category";
$route['app/categories']                    =               "Stories/categories";
$route['app/change-password']               =               "Dashboard/change_password";
$route['app/comments']                      =               "Stories/comments";
$route['app/new-story']                     =               "Stories/new_story";
$route['app/save-story']                    =               "Stories/save_story";
$route['app/stories']                       =               "Stories/index";
$route['app/stories/media']                 =               "Stories/media";
$route['app/users']                         =               "Dashboard/users";
$route['app/update-account']                =               "Dashboard/update_account";
$route['app/update-content']                =               "Dashboard/update_content";
$route['app/update-story']                  =               "Stories/update_story";
$route['app/uploads']                       =               "Stories/upload_files";
$route['logout']                            =               "Auth/sign_out";
$route['search']                            =               "Stories/search";

$route['app/(:any)']                        =               "Dashboard/user/$1";
$route['app/edit/(:any)']                   =               "Stories/edits/$1";
$route['password-reset/(:any)']             =               "Dashboard/reset_password/$1";
$route['story/(:any)']                      =               "Stories/story/$1";
//Login process
$route['dashboard/(:any)']                  =               "Dashboard/index/$1";
$route['recover-password/(:any)']           =               "Auth/reset_password/$1";