<?php
session_start();
include_once "conexion.php";

function verificar_login($con, $user,$password,&$result) {
    $sql = "SELECT * FROM tbl_usuarios WHERE nombre_usuario = '$user' and password_usuario = '$password'";
    $rec = mysqli_query($con, $sql);
    $count = 0;

    while($row = mysqli_fetch_object($rec)){
        $count++;
        $result = $row;
    }

    if($count == 1)
    {
        return 1;
    }

    else
    {
        return 0;
    }
}

if(!isset($_SESSION['userid']))
{
    if(isset($_POST['login']))
    {
        if(verificar_login($con, $_POST['user'],$_POST['password'],$result) == 1)
        {
            //Abro sesion y añado las variables.
            session_start();
            $_SESSION['userid'] = $result->idusuario;
            $_SESSION['username'] = $_POST['user']; 
            header("location:home.php");
        }
        else
        {
            echo '<div class="error">Su usuario es incorrecto, intentelo de nuevo.</div>';
        }
    }
?>
<?php
} else {
  echo 'Su usuario se ingreso correctamente.';
  echo '<a href="logout.php">Logout</a>';
}
?>
<style type="text/css">
  .error{
    color: red;
    font-weight: bold;
    margin: 10px;
    text-align: center;
}
</style>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Reserva de recursos</title>
  <link rel="stylesheet" href="css/style.css" TYPE="text/css" MEDIA=screen> 
</head>

<body>
  <div class="login">
  <div class="heading">
    <h2>Acceder</h2>
    <form action="" method="post" class="login">

      <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class="fa fa-user"></i></span>
        <input type="text" name="user" id="user" required="" class="form-control" placeholder="Usuario">
          </div>

        <div class="input-group input-group-lg">
          <span class="input-group-addon"><i class="fa fa-lock"></i></span>
          <input type="password" name="password" id="password" required="" class="form-control" placeholder="Contraseña">
        </div>
        <button name="login" type="submit" value="login" class="float" >Acceder</button>
       </form>
 		</div>
 </div>
  
  
</body>
</html>
