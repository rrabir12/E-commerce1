<?php

session_start();

include('../server/connect.php');

if(!isset($_SESSION['admin_logged_in'])){
  header('location: admin_login.php');
  exit;
}

if(isset($_GET['user_id'])){

$user_id=$_GET['user_id'];
$stm=$conn->prepare("DELETE FROM users WHERE user_id=?");
$stm->bind_param('i',$user_id);

if($stm->execute()){
header('location: users.php?deleted_success=user has been deleted successfully');
}else{
header('location: users.php?deleted_failure=could not deleted product');   
}

}


?>