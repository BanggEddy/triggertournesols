<!DOCTYPE html>
<html>
<nav class="navbar navbar-expand-lg navbar-success bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.php"><img src="Images/logo-haribo.jpg" height="100" width="100" alt="..."></a>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0"></ul>
			<div class="container-fluid">
				<form class="d-flex" method="POST" action='#'>
					<input class="form-control me-2" type="search" placeholder="Rechercher des bonbons" aria-label="Recherche" name="recherche">
					<input class="btn btn-warning" type="submit" value="Rechercher">
				</form>
			</div>
			<button type="button" class="btn btn-warning"> <a href="#">Végétaux achetés</a>

				<button type="button" class="btn btn-warning"> <a href="#">Végétaux achetés</a>

		</div>
	</div>

</nav>

<head>
	<title>Végétaux achetés</title>
</head>

<body>
	<center>
		<br><br>
		<?php
		if (!isset($_POST['ref'])) {
			echo "<h1>La référence du végétal n'a pas été renseignée.</h1>";
			exit;
		}

		$ref = $_POST['ref'];
		$qte = $_POST['quantite'];

		$conn = mysqli_connect("localhost", "root", "", "lestournesolstrigger111");

		if (!$conn) {
			die("Connexion échouée: " . mysqli_connect_error());
		}

		$sql = "SELECT QuantiteEnStock FROM vegetauxachetes WHERE ReferenceProduit='$ref'";
		$result = mysqli_query($conn, $sql);

		if (mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_assoc($result);
			$stock = $row["QuantiteEnStock"];

			if ($qte > $stock) {
				echo "<h1>La quantité demandée n'est pas disponible en stock.</h1>";
			} else {
				$nouveau_stock = $stock - $qte;
				$sql = "INSERT INTO vendre VALUES ('$ref',date('YYYY-mm-dd'),'$nouveau_stock')";
				if (mysqli_query($conn, $sql)) {
					echo "<h1>Vos végétaux ont bien été vendus.</h1>";
				} else {
					echo "<h1>Il y a eu une erreur lors de la tentative de mise à jour de la quantité. : " . mysqli_error($conn) . "</h1>";
				}
			}
		} else {
			echo "<h1>Le végétal requis n'a pas été trouvé.</h1>";
		}




		mysqli_close($conn);

		?>
		<br><br>
		<img src='Images/front.jpg' width='45%' alt='' ...''>
		<br><br><br> <a href='index.php'> <button type='button' class='btn btn-warning'>Retourner à l'index</button> </a>;
	</center>
</body>
<!-- Optional JavaScript; choose one of the two! -->
<script src="to-top.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</html>