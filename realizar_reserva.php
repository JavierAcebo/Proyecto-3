 <?php
// Se incluye el miniscript de tratamiento de fechas
  include ("scripts/fechas.php");
// Se crea la hora, a partir de las horas y minutos establecidos en el formulario de nueva cita.
  $horaDeCita=$_POST["hora"].":".$_POST["minutos"];
// Se monta la consulta para grabar una nueva cita.
  $consulta="INSERT INTO tbl_reservas (nombre_usuario, fecha_inicio_reserva, fecha_final_reserva, id_recursos) VALUES (".$_SESSION["username"]."'$fechaEnCurso','$horaDeCita','');";
// Se ejecuta la consulta.
  $hacerConsulta=mysqli_query ($consulta,$con);
// Se liberan recursos y se cierra la base de datos.
  @mysqli_free_result($hacerConsulta);
  ?>
  <form action="index.php" name="retorno" id="retorno" method="post">
    <input type="hidden" name="fechaEnCurso" id="fechaEnCurso" value="<?php echo ($fechaEnCurso); ?>">
  </form>
