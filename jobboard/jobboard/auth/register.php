<?php require "../config/config.php"; ?>
<?php require "../includes/header.php"; ?>

<?php

if (isset($_SESSION['username'])) {
    header("location: " . APPURL . "");
}



if (isset($_POST['submit'])) {

    if (empty($_POST['username']) or empty($_POST['email']) or empty($_POST['password']) or empty($_POST['re-password'])) {
        echo "<div class'alert alert-dange bg-danger text-white'> some input here </div>";
    } else {
        $username = $_POST['username'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $repassword = $_POST['re-password'];
        $img = "img.jpeg";
        $type = $_POST['type'];


        // Checking the password is same
        if ($password == $repassword) {

            if (strlen($email) > 25 or strlen($username) > 15) {
                echo "<script>alert('email or username is too big')</script>";
            } else {


                //checking for username or email is available or not
                $validate = $conn->query("SELECT * FROM users WHERE email = '$email' OR username='$username'   ");
                $validate->execute();

                if ($validate->rowCount() > 0) {
                    echo "<script>alert('email or username is already taken')</script>";
                } else {
                    $insert = $conn->prepare("INSERT INTO users (username, email, password, img, type)
          VALUES (:username, :email, :password, :img, :type)");

                    $insert->execute([
                        ':username' => $username,
                        ':email' => $email,
                        ':password' => password_hash($password, PASSWORD_DEFAULT),
                        ':img' => $img,
                        ':type' => $type,

                    ]);

                    header("location: login.php");



                }






            }


        } else {
            echo "<div class'alert alert-dange bg-danger text-white'> Password dont matches</div>";
        }
    }
}



?>
<section class="section-hero overlay inner-page bg-image" style="background-image: url('../images/hero_1.jpg');"
    id="home-section">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h1 class="text-white font-weight-bold">Register</h1>
                <div class="custom-breadcrumbs">
                    <a href="<?php echo APPURL; ?>">Home</a> <span class="mx-2 slash">/</span>
                    <span class="text-white"><strong>Register</strong></span>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="site-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12 mb-5">

                <form action="register.php" class="p-4 border rounded" method="post">
                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="text-black" for="fname">Username</label>
                            <input type="text" id="fname" class="form-control" required name="username"
                                placeholder="Username">
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="text-black" for="fname">Email</label>

                            <input type="email" class="form-control" id="fname" required name="email"
                                placeholder="Email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="job-type">User Type</label>
                        <select name="type" class="selectpicker border rounded" id="user-type" data-style="btn-black"
                            data-width="100%" data-live-search="true" title="Select User Type">
                            <option>Worker</option>
                            <option>Company</option>
                        </select>
                    </div>

                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="text-black" for="fname">Password</label>
                            <input type="password" class="form-control" id="fname" required name="password"
                                placeholder="Password">
                        </div>
                    </div>

                    <div class="row form-group mb-4">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="text-black" for="fname">Re-Type Password</label>
                            <input type="password" class="form-control" id="fname" required name="re-password"
                                placeholder="Re-enter Password">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-12">
                            <input type="submit" name="submit" value="Signup" class="btn px-4 btn-primary text-white">
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</section>

<?php require "../includes/footer.php"; ?>