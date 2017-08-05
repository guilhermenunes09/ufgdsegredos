<?php

	include_once($_SERVER['DOCUMENT_ROOT']."\SegredosUFGD"."\header\connection.php");
	$id = $_POST["id"];
	
	$sql = "UPDATE inbox SET sent=-1 WHERE id=$id";
	$result=mysqli_query($conn,$sql);
	echo ($result);

?>