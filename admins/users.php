<?php 

include('../server/connect.php');

 //determine page no.
 if(isset($_GET['page_no']) && $_GET['page_no'] !=""){
    //if user has already entered page num is the ont that they selected
    $page_no=$_GET['page_no'];
}else{
    $page_no=1;
}

//return no. of products
$stm1=$conn->prepare("SELECT COUNT(*) As total_records FROM users");
$stm1->execute();
$stm1->bind_result($total_records);
$stm1->store_result();
$stm1->fetch();

//products per page
$total_records_per_page=5;
$offset=($page_no-1) * $total_records_per_page;
$previous_page=$page_no-1;
$next_page=$page_no+1;
$adjacents="2";
$total_no_of_pages=ceil($total_records/$total_records_per_page);

//get all products
$stm2=$conn->prepare("SELECT * FROM users LIMIT $offset,$total_records_per_page");
$stm2->execute();
$users=$stm2->get_result();


?>


<?php include('header.php'); ?>

<body>

<div class="container-fluid">
  <div class="row">
    
   <?php include('sidebar.php'); ?>
  
   <div class="col-md-9 content">
      <h2>Users</h2>

      <?php if(isset($_GET['deleted_success'])) { ?>
        <p class="text-center" style="color: green;"><?php echo $_GET['deleted_success']; ?></p>
      <?php } ?>

      <?php if(isset($_GET['deleted_failure'])) { ?>
        <p class="text-center" style="color: red;"><?php echo $_GET['deleted_failure']; ?></p>
      <?php } ?>

      <table class="table">
    <thead>
        <tr>
            <th scope="col">User ID</th>
            <th scope="col">User name</th>
            <th scope="col">User email</th>
            <th scope="col">User password</th>
            <th scope="col">Actions</th>
        </tr>
    </thead>
    <tbody>

    <?php foreach($users as $user) { ?>
        <tr>
            <td><?php echo $user['user_id']; ?></td>
            <td><?php echo $user['user_name']; ?></td>
            <td><?php echo $user['user_email']; ?></td>
            <td><?php echo $user['user_password']; ?></td>
            <td>
                <a class="btn btn-danger" href="delete_user.php?user_id=<?php echo $user['user_id']; ?>">Delete</a>
            </td>
        </tr>
     <?php } ?>

    </tbody>
</table>
<nav aria-label="page navigation example">
                            <ul class="pagination">
                              <li class="page-item <?php if($page_no<=1){echo 'disabled';} ?>">
                                <a class="page-link" href="<?php if($page_no <= 1){echo '#';}else{echo "?page_no=".($page_no-1);} ?>">Previous</a>
                            </li>

                              <li class="page-item"><a class="page-link" href="?page_no=1">1</a></li>
                              <li class="page-item"><a class="page-link" href="?page_no=2">2</a></li>

                              <?php if($page_no>=3){ ?>
                              <li class="page-item"><a class="page-link" href="#">...</a></li>
                              <li class="page-item"><a class="page-link" href="<?php echo "?page_no=".$page_no; ?>"><?php echo $page_no; ?></a></li>
                              <?php } ?>

                              <li class="page-item <?php if($page_no>=$total_no_of_pages){echo 'disabled';} ?>">
                                 <a class="page-link" href="<?php if($page_no >= $total_no_of_pages){echo '#';}else{echo "?page_no=".($page_no+1);} ?>">Next</a>
                                </li>
                           
                            </ul>
                        </nav>
</div>
</div>
</div>
</body>
</html>

