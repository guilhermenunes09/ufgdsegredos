<?php
include_once($_SERVER['DOCUMENT_ROOT']."\SegredosUFGD"."\header\connection.php");

$id = $_POST["id"];
$message = $_POST["message"];

/* get text from front end */
$sql = "UPDATE `inbox` SET `sent`=true WHERE id=$id";
$result = $conn->query($sql);
if($result){
  /* get text from front end */
  $sql = "UPDATE inbox s SET s.message='$message' WHERE id=$id";
  $result = $conn->query($sql);


  $sql = "SELECT s.message,s.image_url,s.link FROM inbox s WHERE id=$id";
  $result = $conn->query($sql);
  /* se der errado finaliza script */
  if(!$result) { 
    echo "falhou #1";
    exit();
  }
  /* obtém a mensagem do banco */
  $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
  $message = $row["message"];
  $imageUrl = $row["image_url"];
  $link = $row["link"];

} else {
  echo "falhou #2";
  exit();
}

// separar os dados das mensagens
  function multiexplode ($delimiters,$string) 
  {
    $ready = str_replace($delimiters, $delimiters[0], $string);
    $launch = explode($delimiters[0], $ready);
    return  $launch;
  }


function postText($conn,$fb,$id,$pageId,$accessToken,$messageInbox,$imageUrl,$link,$nextPostId){
    $nextPostFormat = number_format($nextPostId,0,",",".");
    $messagePost = "#$nextPostFormat - ".$messageInbox; 

    $linkData = array(
      'message' => "$messagePost",
      'link' => "$imageUrl",
      'url' => "$imageUrl"

    );
    var_dump("C:\wamp\www\SegredosUFGD\images\\$imageUrl");
    try {
      if($imageUrl) {
        $fb->post("/$pageId/photos", $linkData, $accessToken);
      } else {
        $fb->post("/$pageId/feed", $linkData, $accessToken);
      }

    echo "true";
    } catch(Facebook\Exceptions\FacebookResponseException $e) {
      echo 'Graph returned an error: ' . $e->getMessage();
      exit;
    } catch(Facebook\Exceptions\FacebookSDKException $e) {
      echo 'Facebook SDK returned an error: ' . $e->getMessage();
      exit;
    }


}

function getPostIdText ($text)
{
  //Verifica se String existe no início
  if(substr( $text, 0, 1 ) === "#"){

    $exploded = multiexplode(array("#","-","\""),$text);
    $postIdS = ltrim($exploded[1]);
    $postIdS = str_replace(" ", "", $postIdS); 
    $postIdS = str_replace(".", "", $postIdS);
    return (int) $postIdS;

  } else {

    return false;
  }
    
}


$lastPostId = false;
$countLimit = 1;

//Verifica mensagens do FEED que tenham o padrão "#123 - {texto}"
while(!$lastPostId){

  
  //obtém o último feed da pagina
  $response = $fb -> get("$pageId/feed?limit=$countLimit",$accessToken);
  $valId = $response->getDecodedBody();


  $lastPostDatetime = $valId['data'][$countLimit-1]['created_time'];
  // transforma a string em Datetime
  // format 2017-07-30T13:20:46+0000
  $dateLast = new DateTime($lastPostDatetime); 
  $postText = $valId['data'][$countLimit-1]['message'];
  $lastPostId = getPostIdText($postText);
  $nextPostId = $lastPostId + 1;
  $countLimit++;

  if($countLimit>=5){
      break;
  }

}

 postText($conn,$fb,$id,$pageId,$accessToken,$message,$imageUrl,$link,$nextPostId);






?>