<?php
	if (!session_id()) {
   	 session_start();
	}
	$teste = "Ola";
	$ola = array("ola");
	var_dump($_SESSION[fb-callback]);
?>

<!DOCTYPE html>
<html>
<head>
	<title>Login - UFGD Segredos</title>
	<link rel="stylesheet" href="style/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<?php

require('vendor/autoload.php');

$fb = new Facebook\Facebook([
  'app_id' => '324726521314470',
  'app_secret' => 'b13da3736aebe32195db171340e30ba5',
  'default_graph_version' => 'v2.10',
  ]);

$helper = $fb->getRedirectLoginHelper();

$permissions = ['email','publish_actions','pages_show_list','user_photos','manage_pages','pages_messaging','publish_pages','read_page_mailboxes','pages_messaging_phone_number','pages_messaging_subscriptions']; // Optional permissions
$loginUrl = $helper->getLoginUrl('http://localhost/fb-callback.php', $permissions);
?>
 <div style="text-align: center; width: 100%;  top:200px; position: absolute;">
 <img src="images/logo.png" width="205" height="241">
 <div style="left:0; top:50px; width: 100%; height: 50px; position: relative;">
<?php
echo '<a href="' . $loginUrl . '" class="btn btn-primary fb-login-button">Entar com Facebook</a>';
?>
 </div>
 </div>
</body>
</html>