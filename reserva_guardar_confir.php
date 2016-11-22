<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<?php
if ($grabarCita == $Reservar) {
	header('Location: reserva_guardar.php');
}
elseif ($anularCita == $Cancelar) {
	header('Location: home.php');
}
?>


</body>
</html>