<?php
require('../header/connection.php');


/**************************************/

// separar os dados das mensagens
  function multiexplode ($delimiters,$string) 
  {
    $ready = str_replace($delimiters, $delimiters[0], $string);
    $launch = explode($delimiters[0], $ready);
    return  $launch;
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

  function getLinkFromText($text){

      // The Regular Expression filter
      $reg_exUrl = "/(http|https|ftp|ftps)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?/";

      // Check if there is a url in the text
      if(preg_match($reg_exUrl, $text, $url)) {
             // make the urls hyper links
             return $url[0];

      } else {
             // if no urls in the text just return the text
             return false;
      }

  }

$lastPostId = false;
$countLimit = 1;


//Obtém data da última mensagem do banco de dados, se não houver pega do último post no feed

$sql =  "SELECT sent_byuser FROM inbox ORDER BY sent_byuser DESC LIMIT 1";
$result=mysqli_query($conn,$sql);
$validate=false;

if($result)
{
    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
    if($row>0){
      $sentByuser = $row["sent_byuser"];

      $dateLast = $sentByuser;
      $validate = true;
    }
}
if(!$validate)
{
  //Verifica mensagens do FEED que tenham o padrão "#123 - {texto}"
  while(!$lastPostId)
  {

    //obtém o último feed da pagina
    $response = $fb -> get("$pageId/feed?limit=$countLimit",$accessToken);
    $valId = $response->getDecodedBody();
    $lastPostDatetime = $valId['data'][$countLimit-1]['created_time'];

    // transforma a string em Datetime
    // format 2017-07-30T13:20:46+0000

    $dateLast = strtotime($lastPostDatetime);
    $dateLast = date('Y-m-d H:i:s', $dateLast);
    $postText = $valId['data'][$countLimit-1]['message'];
    $lastPostId = getPostIdText($postText);
    $nextPostId = $lastPostId + 1;
    $countLimit++;

    if($lastPostId){
      $validate = true;
    }

    if($countLimit>=5){
        break;
    }
  }
}

if($validate)
{
  //Obtém lista de mensagens
  $response = $fb -> get("$pageId/?fields=conversations.limit(50){message_count}",$accessToken);
  $valId = $response->getDecodedBody();
  //$messageId = $valId['data'][0]['id'];

  $arraySize = sizeof($valId['conversations']['data']);
  //Procura em todas as conversas
    for($i=0;$i<$arraySize;$i++)
    {
        $messagesCount = $valId['conversations']['data'][$i]['message_count'];
        $messageId = $valId['conversations']['data'][$i]['id'];
        
        // verifica no máximo as 5 últimas mensagens
        if($messagesCount>1) {
          $iterations = $messagesCount;
          if($messagesCount>=5){
              $iterations = 5; 
          }
        } else {
          $iterations = 1;
        } 
        

        //Acessa cada conversa e compara datas dentro da mensagem
        //Obtem corpo da mensagem
        $response = $fb -> get("$messageId?fields=messages.limit($iterations){message,created_time,from,attachments{image_data}}",$accessToken);
        $inbox = $response->getDecodedBody();
        $contImg = 0;
        for($j=$iterations-1;$j>=0;$j--)
        {
            $messageCreatedTime = $inbox['messages']['data'][$j]['created_time'];
            $dateSource = strtotime($messageCreatedTime);
            $timestamp = date('Y-m-d H:i:s', $dateSource);

            if($timestamp > $dateLast)
            {
                $messageInbox = $inbox['messages']['data'][$j]['message'];
                $user = $inbox['messages']['data'][$j]['from']['name'];
                $imageUrl = $inbox['messages']['data'][$j]['attachments']['data'][0]['image_data']['url'];
               
                $link = getLinkFromText($messageInbox);

                $user = $conn->real_escape_string($user);
                $messageInbox = $conn->real_escape_string($messageInbox);

               
                if($messageInbox && $j==$iterations-1) {
                   $messageDb = $messageInbox;
                } else {
                  if($messageDb) {
                     $messageDb = $messageDb."<%><%>".$messageInbox;
                   } else {
                     $messageDb = $messageInbox;
                   }
                }
               
   
                
                if($link) $linkDb = $link;
                if($imageUrl) $imageUrlDb = $imageUrl;

                if($j==0) //Grava no banco as mensagens juntas
                {
                  //grava no banco de dados
                  $sql = "INSERT INTO inbox (user,message,sent_byuser,image_url,link) VALUES('$user','$messageDb','$timestamp','$imageUrlDb','$linkDb')";
                  $result = $conn->query($sql);
                  
                  if($result) {
                    //echo "mensagem aceita";
                  }
                }

              } else {
                //echo "mensagem ignorada";
              }

        }
    }
} else {
    //echo "Não foi encontrado POST com ID no feed. Para corrigir isso, você pode editar algum dos últimos posts no padrão #12.123 - {algum texto}. O processo foi encerrado. Obrigado.";
    exit();
}

?>