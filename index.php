<!DOCTYPE html>
<html>

<head>
    <title>Végétaux</title>
</head>
<nav class="navbar navbar-expand-lg navbar-success bg-success">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.php"><img src="Images/logo-haribo.jpg" height="100" width="100" alt="..."></a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0"></ul>
            <div class="container-fluid">
                <form class="d-flex" method="POST" action='recherchevisi.php'>
                    <input class="form-control me-2" type="search" placeholder="Rechercher des bonbons" aria-label="Recherche" name="recherche">
                    <input class="btn btn-warning" type="submit" value="Rechercher">
                </form>
            </div>
            <button type="button" class="btn btn-warning"> <a href="#">Végétaux achetés</a>

                <button type="button" class="btn btn-warning"> <a href="#">Végétaux achetés</a>

        </div>
    </div>

</nav>

<body>
    <br><br>
    <center>
        <h3>Bienvenue dans la page des végétaux !</h3>

        <tr>
            <div class='card' style='width: 15rem;'>
                <div class='card-body'>
        </tr>
        <?php
        $conn = mysqli_connect("localhost", "root", "", "lestournesolstrigger111");

        if (!$conn) {
            die("Connexion échouée: " . mysqli_connect_error());
        }

        $sql = "SELECT v.ReferenceProduit, v.DesignationProduit, va.QuantiteEnStock, a.DateApprovisionnement, a.QtAppro
                FROM vegetaux v
                INNER JOIN vegetauxachetes va ON v.ReferenceProduit = va.ReferenceProduit
                LEFT JOIN approvisionner a ON v.ReferenceProduit = a.ReferenceProduit";
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<h4 class='card-text'>" . $row["ReferenceProduit"] . "</h4><P class='card-title'>" . $row["DesignationProduit"] . "</P><P class='card-title'>" . $row["QuantiteEnStock"] . "</P><td style='
                padding: 20px;'>";
                echo "</td><td><form method='post' action='vendre.php'><input type='hidden' name='ref' value='" . $row["ReferenceProduit"] . "'><input type='number' name='quantite' min='1' max='" . $row["QuantiteEnStock"] . "' required><input type='submit' class='btn btn-warning' value='Acheter'></form> -----------------------------";
            }
        } else {
            echo "<tr><td colspan='5'>Aucun résultat</td></tr>";
        }

        ?>
    </center>
    <!-- Optional JavaScript; choose one of the two! -->
    <script src="to-top.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>