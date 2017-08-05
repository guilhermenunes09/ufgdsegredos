<?php
	if (!session_id()) {
    	session_start();
	}
	if(!isset($_SESSION['fb_access_token'])) {
		header("location:login.php");
	} 
?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="js/main.js"></script>
	<link rel="stylesheet" href="style/style.css">
	

	<title>Segredos UFGD Lab</title>
</head>
<body>
	<div class="navbar nav navbar-default">
	</div>

	

	<div class="contentAjax1">
	</div>

	<div class="col-lg-7 col-md-7 col-sm-11 col-lg-offset-2">
		<div id="init form-group form-inline">
			<label for="phref">Frase de início:</label>
			<input class="form-control" type="text" id="phref" value="Confesso que: ">
		</div>
		<div class="contentAjax2  panel panel-body">


		</div>
	</div>



	
</body>
</html>