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
<?php
  // Se incluye el miniscript de tratamiento de fechas
  include ("scripts/fechas.php");
  // Se crea la hora, a partir de las horas y minutos establecidos en el formulario de nueva cita.
  if (isset($_POST['grabarCita'])) {
    $recurso= $_POST['id_recurso'];
    $horaIni=$_POST["hora_inicio"];
    $horaFi=$_POST["hora_final"];
    $fechaIni=$_POST['fecha_inicio'];
    $fechaFi=$_POST['fecha_final'];
    $estado=$_POST['estado_reserva'];

    // Se monta la consulta para grabar una nueva cita.
    $sql_consulta = "SELECT * FROM tbl_reservas WHERE ('".$fechaIni."' BETWEEN fecha_inicio_reserva AND fecha_final_reserva OR '".$fechaFi."' BETWEEN fecha_inicio_reserva AND fecha_final_reserva) AND id_recursos =".$recurso."";
    $enviar2 = mysqli_query ($con, $sql_consulta);
    var_dump($enviar2);
    print_r($enviar2);
    // $filas=mysqli_num_rows($enviar2);

    if ($filas<1) {
      echo "dentro";
      $consulta="INSERT INTO tbl_reservas (id_recursos, nombre_usuario, fecha_inicio_reserva, fecha_final_reserva, hora_inicio_reserva, hora_final_reserva) VALUES ('$recurso','".$_SESSION['username']."','$fechaIni','$fechaFi', '$horaIni', '$horaFi');";
      $enviar = mysqli_query ($con, $consulta);
      //header('location: home.php?reserva=ok');
    }
    if ($estado==0)  {
      $sql_disponible= "UPDATE `tbl_recursos` SET `estado_recursos` = '1' WHERE `tbl_recursos`.`id_recursos` = $recurso;";
      $enviar3 = mysqli_query ($con, $sql_disponible);
    }
    
  }else{
    echo "anularCita";
    header('location: home.php');
  }
?>
