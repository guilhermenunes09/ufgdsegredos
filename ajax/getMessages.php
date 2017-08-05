<?php
	// separar os dados das mensagens
	function multiexplode ($delimiters,$string) 
	{
	    $ready = str_replace($delimiters, $delimiters[0], $string);
	    $launch = explode($delimiters[0], $ready);
	    return  $launch;
	}

	include_once($_SERVER['DOCUMENT_ROOT']."\SegredosUFGD"."\header\connection.php");
	$sql_count = "SELECT s.id, s.user, s.message, s.sent_byuser FROM inbox s WHERE s.sent IS NULL";
	$result_count = $conn->query($sql_count);
	$num_rows = mysqli_num_rows($result_count);

	$sql = "SELECT s.id, s.user, s.message, s.sent_byuser, s.image_url FROM inbox s WHERE s.sent IS NULL LIMIT 20";
	$result = $conn->query($sql);
	$idMsg = 0;

    if($num_rows == 0)  echo "<div class='alert alert-success' transform: translate(-50%, -50%)'> Todas as mensagens foram postadas. </div>"; 
	elseif($num_rows == 1)  echo "<div class='alert alert-info'> Você tem  $num_rows mensagem </div>";             
					  else  echo "<div class='alert alert-info'> Você tem  $num_rows mensagens </div>";    
	      

   	while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
	{
		$id = $row["id"];
		$user = $row["user"];
		$message = $row["message"];
		$sent_byuser = $row["sent_byuser"];
		$image_url = $row["image_url"];

		$connector = "<%><%>";
		$numMessages = 1;
		$classMsg = "";

		$dateShow = date("d-m-Y", strtotime($sent_byuser));

		//Verifica se String existe no início
		if(strpos($message, $connector)) {
			$exploded = multiexplode(array("<%><%>","-","\""),$message);
			$numMessages = sizeof($exploded);
			$messageShow = $exploded;
			$classMsg = "panel panel-default";
		} else {
			$messageShow = array($message);
		}


?>
		<div class="panel panel-group panel-primary">
				<div class="panel-heading" style="text-align: right;">
					<?php echo "$user "; echo $dateShow;?>
				</div>
				
				<div class="panel-body" style="min-height: 300px;">
					<div class="">

						<?php for($i=0;$i<$numMessages;$i++) { ?>

							<div class="<?php echo $classMsg; ?> panel<?php echo $idMsg."-".$i; ?>" style="padding:10px; padding-left: 30px;">
							<?php if($numMessages>1) { ?><div id ="delete-msg" alias="<?php echo $id; ?>" pos="<?php echo $i; ?>" class="pull-right" style="cursor: pointer; cursor: hand;">Deletar</div><?php } ?>
							<h4><span id="pre<?php echo $idMsg."-".$i; ?>"></span><span id="<?php echo $idMsg."-".$i; ?>"><?php echo trim($messageShow[$i]); ?></span><span id="af<?php echo $idMsg."-".$i; ?>"></span>
							</h4>
							
							</div>
						<?php } ?>
						<?php if($image_url) echo "<img src='$image_url'></img>"; ?>
					</div>
				</div>
				
				<div class="panel-footer">
					<div class="buttons" style="margin:auto; text-align: center;">
						<button id="send<?php echo $idMsg;?>" alias="<?php echo $idMsg; $idMsg++; ?>" num="<?php echo $numMessages; ?>" value="<?php echo $id; ?>" class="btn btn-info send" style="height: 50px; width: 300px">Postar</button>
						<button id="dismiss" value="<?php echo $id; ?>" alias="<?php echo $user; ?>" class="btn btn-basic" style="height: 50px; width: 300px">Não Postar</button>
						<?php if($numMessages>1) { ?>
							<button id="dismiss" class="btn btn-basic" style="height: 50px;"><></button>
						<?php } ?>
					</div>
				</div>
		</div>
		
<?php } ?>

<script type="text/javascript">
	data();
</script>