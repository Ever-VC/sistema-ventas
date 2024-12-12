<?php
require_once 'config/global.php';

$connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

mysqli_query($connection, 'SET NAMES "'. DB_CHARSET .'"');

if(mysqli_connect_errno()){
    printf("Fallo la conexión a la base de datos: %s\n", mysqli_connect_error());
    exit();
}

function executeQuery($query){
    global $connection;
    $result = mysqli_query($connection, $query);
    return $result;
}

function executeQueryUnique($query){
    global $connection;
    $result = mysqli_query($connection, $query);
    $row = mysqli_fetch_assoc($result);
    return $row;
}

function executeQueryReturnID($query){
    global $connection;
    $result = mysqli_query($connection, $query);
    return mysqli_insert_id($connection);
}

function clearString($string){
    global $connection;
    $str = mysqli_real_escape_string($connection, trim($string));
    return htmlspecialchars($str);
}

// function executeQueryCount($query){
//     global $connection;
//     $result = mysqli_query($connection, $query);
//     return mysqli_num_rows($result);
// }

// function executeQueryAssoc($query){
//     global $connection;
//     $result = mysqli_query($connection, $query);
//     $array = array();
//     while($row = mysqli_fetch_assoc($result)){
//         $array[] = $row;
//     }
//     return $array;
// }

?>