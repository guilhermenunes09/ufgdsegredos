<?php
	$id = $_POST["id"];
	$pos = (int)$_POST["pos"];
	
	include_once($_SERVER['DOCUMENT_ROOT']."\SegredosUFGD"."\header\connection.php");

	$sql = "SELECT s.message FROM inbox s WHERE id=$id";
	$result=mysqli_query($conn,$sql);
	$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
	$message = $row["message"];
	// separar os dados das mensagens
	function multiexplode ($delimiters,$string) 
	{
	    $ready = str_replace($delimiters, $delimiters[0], $string);
	    $launch = explode($delimiters[0], $ready);
	    return  $launch;
	}

	$exploded = multiexplode(array("<%><%>","-","\""),$message);
	$numMessages = sizeof($exploded);
 	$newMessage = '';
 	
	for($i=0;$i<$numMessages;$i++)
	{

		if($i!==(int)$pos){
			//echo "$i - $pos";
			//echo $exploded[$i]; echo "<br>";
		  if($i==$numMessages-1) {
		  	$conChar="";
		  } else {

		  	$conChar = "<%><%>";
		  	if(($pos==$numMessages-1)&&$i==$numMessages-2){
		  		$conChar="";
		  	}
		  }
		  $newMessage .= $exploded[$i] . $conChar;
		}
	}

	$sql = "UPDATE inbox SET message='$newMessage' WHERE id=$id";
	$result = $conn->query($sql);
	if($result){
		echo "ola";
	}


?>