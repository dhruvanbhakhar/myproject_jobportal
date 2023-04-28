<?php require "../includes/header.php"; ?>
<?php require "../config/config.php"; ?>





<?php


$select = $conn->query("SELECT * FROM users WHERE type='Company'");
$select->execute();

$allCompanies = $select->fetchAll(PDO::FETCH_OBJ);



?>


<section class="section-hero overlay inner-page bg-image"
    style="background-image: url('<?php echo APPURL; ?>/images/hero_1.jpg');" id="home-section">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h1 class="text-white font-weight-bold">Companies</h1>
                <div class="custom-breadcrumbs">
                    <a href="<?php echo APPURL; ?>">Home</a> <span class="mx-2 slash">/</span>
                    <span class="text-white"><strong>Companies</strong></span>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="site-section" style="" id="home-section">
    <div class="container">
        <div class="row ">
            <?php foreach($allCompanies as $Companies) : ?>
            <div class="col-md-6">
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" style="200px" src="../users/user-imges/<?php echo ($Companies->img); ?>" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo ($Companies->username); ?></h5>
                        <p class="card-text"><?php echo substr($Companies->bio, 0, 50);?></p>
                        <a target="_blank" href="../users/public-profile.php?id=<?php echo $Companies->id; ?>" class="btn btn-primary">Go to profile</a>
                    </div>
                </div>
                <br>
            </div>
          
            <?php endforeach; ?>
        </div>
    </div>
</section>



<?php require "../includes/footer.php"; ?>


