<?php
include("conexion.php");
session_start();
   if (is_null($_SESSION['username'])) {
   	echo "enviar";
    header("Location: index.php"); /* Redirect browser */
   }
else {

}
?>

<!DOCTYPE html>
<html>
	<head>
	<link rel="/img/favicon/apple-touch-icon-precomposed" sizes="57x57" href="http://javieisrael.esy.es/apple-touch-icon-57x57.png" />
<link rel="/img/favicon/apple-touch-icon-precomposed" sizes="114x114" href="http://javieisrael.esy.es/apple-touch-icon-114x114.png" />
<link rel="/img/favicon/apple-touch-icon-precomposed" sizes="72x72" href="http://javieisrael.esy.es/apple-touch-icon-72x72.png" />
<link rel="/img/favicon/apple-touch-icon-precomposed" sizes="144x144" href="http://javieisrael.esy.es/apple-touch-icon-144x144.png" />
<link rel="/img/favicon/apple-touch-icon-precomposed" sizes="60x60" href="http://javieisrael.esy.es/apple-touch-icon-60x60.png" />
<link rel="/img/favicon/apple-touch-icon-precomposed" sizes="120x120" href="http://javieisrael.esy.es/apple-touch-icon-120x120.png" />
<link rel="/img/favicon/apple-touch-icon-precomposed" sizes="76x76" href="http://javieisrael.esy.es/apple-touch-icon-76x76.png" />
<link rel="/img/favicon/apple-touch-icon-precomposed" sizes="152x152" href="http://javieisrael.esy.es/apple-touch-icon-152x152.png" />
<link rel="icon" type="image/png" href="http://javieisrael.esy.es/favicon-196x196.png" sizes="196x196" />
<link rel="icon" type="image/png" href="http://javieisrael.esy.es/favicon-96x96.png" sizes="96x96" />
<link rel="icon" type="image/png" href="http://javieisrael.esy.es/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="http://javieisrael.esy.es/favicon-16x16.png" sizes="16x16" />
<link rel="icon" type="image/png" href="http://javieisrael.esy.es/favicon-128.png" sizes="128x128" />
<meta name="application-name" content="Reserva de recursos"/>
<meta name="msapplication-TileColor" content="#FFFFFF" />
<meta name="msapplication-TileImage" content="http://javieisrael.esy.es/mstile-144x144.png" />
<meta name="msapplication-square70x70logo" content="http://javieisrael.esy.es/mstile-70x70.png" />
<meta name="msapplication-square150x150logo" content="http://javieisrael.esy.es/mstile-150x150.png" />
<meta name="msapplication-wide310x150logo" content="http://javieisrael.esy.es/mstile-310x150.png" />
<meta name="msapplication-square310x310logo" content="http://javieisrael.esy.es/mstile-310x310.png" />

  <meta charset="UTF-8">
  <title>Reserva de recursos</title>
  <link rel="stylesheet" href="css/style.css" TYPE="text/css" MEDIA=screen> 
</head>
	<body>
	<div class="login">
	<div class="heading">
	
		<?php
	echo "<h2>Bienvenido ";
	echo $_SESSION['username'];
	echo "</h2>";
	?>

	<div>
		<h3 align="center" >Productos disponibles:</h3>
	</div>
	<div class="login">
	

	<?php


	$consulta = mysqli_query ($con, "SELECT * FROM tbl_recursos");

          $numero = mysqli_num_rows($consulta);
         // $propietario = $valores['nombre_recursos'];                                  
          while ($valores = mysqli_fetch_array($consulta)) {
          	$propietario = $valores['nombre_recursos'];
          	if($valores['estado_recursos'] == 0){
          		$estado = "Disponible";
//Escribimos los recursos que están disponibles para su reserva
          		if ($valores['id_recursos'] == 1){
          			echo "<form action='reserva.php'>";
	echo '<div class="recursos_primero"><br/>Recurso: '.$valores['nombre_recursos'].'<br/>Descripción: '.$valores['descripcion_recursos'].'<br/>Estado: '.$estado.'<br/>Foto:<br/> <img width="150" src="img/'.$valores['foto_recursos'].'"><button>Reservar</button><br/> <br/></div>';
					echo "</form>";
	}
	if ($valores['id_recursos'] >= 2 && $valores['id_recursos'] < $numero ){
		echo "<form action='reserva.php'>";
	echo '<div class="recursos"><br/>Recurso: '.$valores['nombre_recursos'].'<br/>Descripción: '.$valores['descripcion_recursos'].'<br/>Estado: '.$estado.'<br/>Foto:<br/> <img width="150" src="img/'.$valores['foto_recursos'].'"><button>Reservar</button><br/> <br/></div>';
	echo "</form>";
	}
	if ($valores['id_recursos'] == $numero){
		echo "<form action='reserva.php'>";
	echo '<div class="recursos_ultimo"><br/>Recurso: '.$valores['nombre_recursos'].'<br/>Descripción: '.$valores['descripcion_recursos'].'<br/>Estado: '.$estado.'<br/>Foto:<br/> <img width="150" src="img/'.$valores['foto_recursos'].'"><button>Reservar</button><br/> <br/></div>';
	echo "</form>";
	}

          	}elseif($valores['estado_recursos'] == 1){
          		$estado = "No disponible";
          		//Escribimos los recursos que no están disponibles para su reserva
          	if ($propietario == 1){
          		//Escribimos los recursos que no están disponibles, pero de los que somos propietarios
          		if ($valores['id_recursos'] == 1){
          			echo "<form action='devolver.php'>";
	echo '<div class="recursos_primero"><br/>Recurso: '.$valores['nombre_recursos'].'<br/>Descripción: '.$valores['descripcion_recursos'].'<br/>Estado: '.$estado.'<br/>Foto:<br/> <img width="150" src="img/'.$valores['foto_recursos'].'"><button>Devolver</button><br/> <br/></div>';
	echo "</form>";
	}
	if ($valores['id_recursos'] >= 2 && $valores['id_recursos'] < $numero ){
		echo "<form action='devolver.php'>";
	echo '<div class="recursos"><br/>Recurso: '.$valores['nombre_recursos'].'<br/>Descripción: '.$valores['descripcion_recursos'].'<br/>Estado: '.$estado.'<br/>Foto:<br/> <img width="150" src="img/'.$valores['foto_recursos'].'"><button>Devolver</button><br/> <br/></div>';
	echo "</form>";
	}
	if ($valores['id_recursos'] == $numero){
		echo "<form action='devolver.php'>";
	echo '<div class="recursos_ultimo"><br/>Recurso: '.$valores['nombre_recursos'].'<br/>Descripción: '.$valores['descripcion_recursos'].'<br/>Estado: '.$estado.'<br/>Foto:<br/> <img width="150" src="img/'.$valores['foto_recursos'].'"><button>Devolver</button><br/> <br/></div>';
	echo "</form>";
	}
	}elseif($propietario == 0){
          	//Escribimos los recursos que no están disponibles, pero de los que NO somos propietarios
          	echo '<div class="recursos_primero"><br/>Recurso: '.$valores['nombre_recursos'].'<br/>Descripción: '.$valores['descripcion_recursos'].'<br/>Estado: '.$estado.'<br/>Foto:<br/> <img width="150" src="img/'.$valores['foto_recursos'].'"><button>No disponible</button><br/> <br/></div>';
	}
	if ($valores['id_recursos'] >= 2 && $valores['id_recursos'] < $numero ){
	echo '<div class="recursos"><br/>Recurso: '.$valores['nombre_recursos'].'<br/>Descripción: '.$valores['descripcion_recursos'].'<br/>Estado: '.$estado.'<br/>Foto:<br/> <img width="150" src="img/'.$valores['foto_recursos'].'"><button>No disponible</button><br/> <br/></div>';
	}
	if ($valores['id_recursos'] == $numero){
	echo '<div class="recursos_ultimo"><br/>Recurso: '.$valores['nombre_recursos'].'<br/>Descripción: '.$valores['descripcion_recursos'].'<br/>Estado: '.$estado.'<br/>Foto:<br/> <img width="150" src="img/'.$valores['foto_recursos'].'"><button>Devolver</button><br/> <br/></div>';
          		
          	}

	}
	}


	?>
	
	<form action="logout.php">
		<div class="input-group input-group-lg">
		</div>
		<button type="submit" class="float" >Cerrar sesión</button>
	</form>
	<form action="estadistica.php">
		<div class="input-group input-group-lg">
		</div>
		<button type="submit" class="float" >Estadísticas de uso</button>

	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</body>
</html>