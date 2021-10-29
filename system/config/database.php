<?php
/*
 * MySql
 */

/*
 * MyQl username for MySQL DAL
 */
$database_config['host'] = 'localhost';
/*
 * MySql username
 */

$database_config['username'] = 'root';
/*
 * Mysql Password
 */
$database_config['password'] = 'root';
/*
 * Mysql database to work with
 */
$database_config['database'] = 'nlb';

/*
 * Redis
 */

/*
 * Redis server host
 */
$redis_configuration['host'] = "localhost";
/*
 * Redis username
 */
$redis_configuration['username'] = null;
/*
 * Redis password
 */
$redis_configuration['password'] = null;

//Default port for redis
$redis_configuration['port'] = 6379;
/*
 * Redis database
 */
$redis_configuration['database'] = 0;
/*
 * Redis key Prefix
 */
$redis_configuration['prefix'] = "_dating";
/*
 * Persistent connection by default is false
 */
$redis_configuration['is_persistent_connection'] = false;
/*
 * Redis auth
 * This can be username name or password
 * Pass it as array
 */
$redis_configuration['auth'] = null; // array("Username" => "Password")

/*
 *
 *
 */

