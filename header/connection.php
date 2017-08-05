<?php 
	if (!session_id()) {
    	session_start();
	}
	require('../vendor/autoload.php');


	$servername = "sql208.rf.gd";
	$username = "rfgd_20479030";
	$password = "Mzi0jXU2";
	$dbname = "rfgd_20479030_ufgdsegredos";

	//Cria uma conexão
	$conn = new mysqli($servername, $username, $password, $dbname);
	mysqli_set_charset($conn,"utf8");
	//Verifica conexão
	if ($conn->connect_error) {
		die("Conexão falhou: " . $conn->connect_error);
	} 

	$appId = '324726521314470';
	$appSecret = 'b13da3736aebe32195db171340e30ba5';
	$fb = new Facebook\Facebook([
	  'app_id' => '324726521314470',
	  'app_secret' => 'b13da3736aebe32195db171340e30ba5',
	  'default_graph_version' => 'v2.10',
	  'fileUpload' => TRUE,
	  ]);

	//$accessToken = $_SESSION['fb_access_token'];
	$userId = $_SESSION['user_id'];
	$accessToken = 'EAAEnVkjzvKYBAFyODme2qch0Pfc5QZAsL9ZCaySa1ucwbVzCXjcVYpgdRJ9droZB0OANDtsDz5Huyqwgy9StozNZBSWAaTGwD6Pf1O3fm3rWMGnpbU9kRlOidKzGCSb7vme9sOQlcnqttc1KkJNgkKFLKZBfIx0teBXRFmvRv7Xn77jkK02OixZCVewiHVT2sZD';//'EAAEnVkjzvKYBANhJGpwG5vWz4SpUlM95D3ZBwt5UkD9WKNFyu8owq3fY6KnPg9tFAgmj0CvMMZAGqfVNZCG6AQFNHHlYBS6c5rLcaWqZCBDvUXThZARDEpdQaq4QqFgFbj79mD0uB96uZAqYOvG3dzk1JlBmYFcJXQA7ZBA8fur1QZDZD'; //expires: 28 de setembro 2017

	$pageId = '110013892973368';


?>