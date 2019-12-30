<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, X-Requested-With");
header('Content-Type: text/html; charset=utf-8');
 

//echo "fathima";exit();
 

$servername = "localhost";
// $username = "u484190787_movies_ratings";
// $password = "Admin@2020";
// $dbname = "u484190787_movies_ratings";
$username = "root";
$password = "";
$dbname = "react";


// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

//print_r($conn);exit;
 
$rest_json = file_get_contents("php://input");
$_POST = json_decode($rest_json, true);

//Get all json data
if(isset($_GET['getvalue'])){
     
	 $result = $conn->query("SELECT id,title,poster_path,rating,overview FROM movies_ratings");
	   
	
 while($row = $result->fetch_assoc())
 {
 $jsonArray[] = $row;
 }
 $myJSON = json_encode($jsonArray);
 echo $myJSON;

}

if(isset($_POST)){

	$id = $_POST['id'];
	$rating = $_POST['rating'];

	$updateQuery = "UPDATE `movies_ratings` SET `rating` = $rating  WHERE `id` = $id";
	 
    if ($conn->query($updateQuery) === TRUE) {
	echo json_encode(["sent" => true, "message" => "rating updated successfully"]);
	}

}

if(isset($_GET['getRandom'])){
     
	 $result = $conn->query("SELECT id,title,poster_path,rating,overview FROM movies_ratings ORDER BY RAND()");
	   
	
 while($row = $result->fetch_assoc())
 {
 $jsonArray[] = $row;
 }
 $myJSON = json_encode($jsonArray);
 echo $myJSON;

}



 

?>
