<?php
if (!session_id()) {
    session_start();
}

require('vendor/autoload.php');

$fb = new Facebook\Facebook([
  'app_id' => '324726521314470',
  'app_secret' => 'b13da3736aebe32195db171340e30ba5',
  'default_graph_version' => 'v2.10',
  ]);

$helper = $fb->getRedirectLoginHelper(); //get user access token

$_SESSION['FBRLH_state']=$_GET['state'];

try {
  $accessToken = $helper->getAccessToken();
} catch(Facebook\Exceptions\FacebookResponseException $e) {
  // When Graph returns an error
  echo 'Graph returned an error: ' . $e->getMessage();
  exit;
} catch(Facebook\Exceptions\FacebookSDKException $e) {
  // When validation fails or other local issues
  echo 'Facebook SDK returned an error: ' . $e->getMessage();
  exit;
}

if (! isset($accessToken)) {
  if ($helper->getError()) {
    header('HTTP/1.0 401 Unauthorized');
    echo "Error: " . $helper->getError() . "\n";
    echo "Error Code: " . $helper->getErrorCode() . "\n";
    echo "Error Reason: " . $helper->getErrorReason() . "\n";
    echo "Error Description: " . $helper->getErrorDescription() . "\n";
  } else {
    header('HTTP/1.0 400 Bad Request');
    echo 'Bad request';
  }
  exit;
}

// Logged in
echo '<h3>Access Token</h3>';
var_dump($accessToken->getValue());

// The OAuth 2.0 client handler helps us manage access tokens
$oAuth2Client = $fb->getOAuth2Client();

// Get the access token metadata from /debug_token
$tokenMetadata = $oAuth2Client->debugToken($accessToken);
echo '<h3>Metadata</h3>';
var_dump($tokenMetadata);

// Validation (these will throw FacebookSDKException's when they fail)
$response = $fb->get("me?fields=id",$accessToken);
$valId = $response->getDecodedBody();
$userId = $valId['id'];

// If you know the user ID this access token belongs to, you can validate it here
$tokenMetadata->validateUserId($userId);
//$tokenMetadata->validateUserId('1306434436139698');
$exp = $tokenMetadata->validateExpiration();
var_dump($exp);
if (! $accessToken->isLongLived()) {
  // Exchanges a short-lived access token for a long-lived one
  try {
    $accessToken = $oAuth2Client->getLongLivedAccessToken($accessToken);
  } catch (Facebook\Exceptions\FacebookSDKException $e) {
    echo "<p>Error getting long-lived access token: " . $e->getMessage() . "</p>\n\n";
    exit;
  }

  echo '<h3>Long-lived</h3>';
  var_dump($accessToken->getValue());
}

$_SESSION['fb_access_token'] = (string) $accessToken;
$_SESSION['user_id'] = (string) $userId;

// User is logged in with a long-lived access token.
// You can redirect them to a members-only page.
header('Location: http://ufgd-segredos.rf.gd/index.php');

?>