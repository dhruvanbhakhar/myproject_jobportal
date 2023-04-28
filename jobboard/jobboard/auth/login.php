<?php require "../config/config.php"; ?>
<?php require "../includes/header.php"; ?>

<?php


if (isset($_SESSION['username'])) {
  header("location: " . APPURL . "");
}

if (isset($_POST['submit'])) {

  if (empty($_POST['email']) or empty($_POST['password'])) {
    echo "<div class'alert alert-dange bg-danger text-white'> some input here </div>";
  } else {

    //checked for submition
    //need to grap the data
    //do the query with email only
    // going to execute and then fetch the data
    // check for the row count
    // check for the password

    $email = $_POST['email'];
    $password = $_POST['password'];

    $login = $conn->query("SELECT * FROM users WHERE email = '$email'");
    $login->execute();

    $select = $login->fetch(PDO::FETCH_ASSOC);


    if ($login->rowCount() > 0) {
      if (password_verify($password, $select['password'])) {

        $_SESSION['username'] = $select['username'];
        $_SESSION['id'] = $select['id'];
        $_SESSION['type'] = $select['type'];
        $_SESSION['email'] = $select['email'];
        $_SESSION['image'] = $select['img'];
        $_SESSION['cv'] = $select['cv '];



        header("location: " . APPURL . "");




      } else {
        echo "<script>alert('user invalid')</script>";
      }


    } else {
      echo "<script>alert('user invalid')</script>";
    }
  }

}
?>





<!-- HOME -->
<section class="section-hero overlay inner-page bg-image"
  style="background-image: url('<?php echo APPURL; ?>/images/hero_1.jpg');" id="home-section">
  <div class="container">
    <div class="row">
      <div class="col-md-7">
        <h1 class="text-white font-weight-bold">Log In</h1>
        <div class="custom-breadcrumbs">
          <a href="<?php echo APPURL; ?>">Home</a> <span class="mx-2 slash">/</span>
          <span class="text-white"><strong>Log In</strong></span>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="site-section">
  <div class="container">
    <div class="row">

      <div class="col-md-12">
        <form action="login.php" class="p-4 border rounded" method="post">

          <div class="row form-group">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="fname">Email</label>
              <input type="email" id="fname" class="form-control" placeholder="Email address" name="email">
            </div>
          </div>
          <div class="row form-group mb-4">
            <div class="col-md-12 mb-3 mb-md-0">
              <label class="text-black" for="fname">Password</label>
              <input type="password" id="fname" class="form-control" placeholder="Password" name="password">
            </div>
          </div>

          <div class="row form-group">
            <div class="col-md-12">
              <input type="submit" value="Log In" name="submit" class="btn px-4 btn-primary text-white">
            </div>
          </div>

        </form>
      </div>
    </div>
  </div>
</section>

<?php require "../includes/footer.php"; ?>