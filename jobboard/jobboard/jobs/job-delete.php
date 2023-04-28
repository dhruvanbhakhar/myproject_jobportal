<?php require "../config/config.php"; ?>



<?php
if (isset($_SESSION['type']) and $_SESSION['type'] !== "Company") {

    header("location:" . APPURL . "");
}
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "DELETE FROM jobs WHERE id='$id'";

    $q = $conn->prepare($sql);


    $delete = $q->execute();





    header("location: http://localhost/jobboard/ ");
    echo "<script>alert('deleted successfully')</script>";

} else {
    echo "404";
}




?>