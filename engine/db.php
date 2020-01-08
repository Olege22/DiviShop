<?php
function getAssocResult($sql){
    /*$db = mysqli_connect(HOST, USER, PASS, DB) or die(include('../test.php'));
    mysqli_query($db, "SET NAMES utf8");
    $result = mysqli_query($db, $sql);*/
/*ini_set('error_reporting', 0);
ini_set('display_errors', 0);
ini_set('display_startup_errors', 0);*/
    $db = getConnection();
    $result = mysqli_query($db, $sql);
	$array_result = array();
	while($row = mysqli_fetch_assoc($result)) {
        //echo "row = <br>"; echo "<pre>" . var_dump($row) . "</pre><br>";
		//echo "result = <br>"; echo "<pre>" . var_dump($result) . "</pre><br>";
        $array_result[] = $row;
    }

    mysqli_close($db);
	return $array_result;
}

function getConnection(){
    $db = mysqli_connect(HOST, USER, PASS, DB) or die(include('../test.php'));
    mysqli_query($db, "SET NAMES utf8");
    return $db;
}

function executeQuery($sql, $db = null){
    if($db == null){
        $db = getConnection();/*
        $db = mysqli_connect(HOST, USER, PASS, DB) or die(include('../test.php'));
        mysqli_query($db, "SET NAMES utf8");*/
    }

	$result = mysqli_query($db, $sql);
    mysqli_close($db);
	return $result;
}

function getRowResult($sql, $db = null){
    $array_result = getAssocResult($sql, $db);

    if(isset($array_result[0]))
        $result = $array_result[0];
    else
        $result = [];

    return $result;
}