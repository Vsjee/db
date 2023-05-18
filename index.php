<?php
include './php/connection.php';

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <title>Parcial DB</title>

  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }
  </style>
</head>

<body class="m-3">

  <main>
    <section class="container d-flex flex-column gap-4 pb-5">
      <h2>Formularios</h2>
      <article>
        <h4>Ingresa Cliente</h4>
        <form type="POST" action="" class="container d-flex flex-column justify-content-center align-items-center gap-3">
          <input type="text" name="c_dniCif" placeholder="dni" class="w-75" required>
          <input type="text" name="c_nombreCL" placeholder="nombre cliente" class="w-75" required>
          <input type="text" name="c_apellidosCL" placeholder="apellidos cliente" class="w-75" required>
          <input type="text" name="c_direccionCL" placeholder="dirección cliente" class="w-75" required>
          <input type="email" name="c_emailCL" placeholder="email cliente" class="w-75" r class="w-75" equired>
          <input type="password" name="c_passCL" placeholder="password cliente" class="w-75" required>
          <input type="text" name="c_imagenCL" placeholder="imagen cliente" class="w-75" required>
          <input type="text" name="c_cpCL" placeholder="cp cliente" class="w-75" required>
          <select name="c_localidad" id="c_localidad" class="w-75" required>
            <option value="">secciona localidad</option>
            <option value="kenedy">kenedy</option>
            <option value="bosa">bosa</option>
            <option value="usaquen">usaquen</option>
          </select>
          <input type="number" name="c_telefonoCI" placeholder="telefono cliente" class="w-75" required>
          <input type="submit" value="Ingresar" class="btn btn-primary w-25 ">
        </form>
      </article>
      <article>
        <h4>Ingresa Factura</h4>
        <form type="POST" action="" class="container d-flex flex-column justify-content-center align-items-center gap-3">
          <input type="number" name="f_nFactura" placeholder="numero factura" class="w-75" required>
          <input type="text" name="f_dniCif" placeholder="dni factura" class="w-75" required>
          <input type="number" name="f_pago" placeholder="pago factura" class="w-75" required>
          <input type="number" name="f_importe" placeholder="import factura" class="w-75" required>
          <select name="f_envio" id="f_envio" class="w-75" required>
            <option value="">seleciona tipo envio</option>
            <option value="expres">expres</option>
            <option value="no expres">no expres</option>
          </select>
          <input type="date" name="f_fecha" placeholder="fecha factura" class="w-75" required>
          <input type="submit" value="Ingresar" class="btn btn-primary w-25">
        </form>
      </article>
      <article>
        <h4>Ingresa Producto</h4>
        <form type="POST" action="" class="container d-flex flex-column justify-content-center align-items-center gap-3">
          <input type="number" name="p_idProducto" placeholder="id producto" class="w-75" required>
          <input type="text" name="p_dniCif" placeholder="dniCif producto" class="w-75" required>
          <input type="text" name="p_nombreProducto" placeholder="nombre producto" class="w-75" required>
          <input type="text" name="p_imagenProducto" placeholder="imagen producto" class="w-75" required>
          <input type="number" name="p_precio" placeholder="precio producto" class="w-75" required>
          <input type="text" name="p_descripcion" placeholder="descripción producto" class="w-75" required>
          <input type="text" name="p_impresion" placeholder="impresión producto" class="w-75" required>
          <select name="p_acabado" id="p_acabado" class="w-75" required>
            <option value="">seleciona acabado</option>
            <option value="metalizado">metalizado</option>
            <option value="platico">platico</option>
            <option value="perlado">perlado</option>
          </select>
          <select name="p_tipoPapel" id="p_tipoPapel" class="w-75" required>
            <option value="">seleciona tipo papel</option>
            <option value="rugoso">rugoso</option>
            <option value="liso">liso</option>
          </select>
          <select name="p_tamanoProducto" id="p_tamanoProducto" class="w-75" required>
            <option value=""> seleciona tamaño</option>
            <option value="pequeño">pequeño</option>
            <option value="mediano">mediano</option>
            <option value="grande">grande</option>
          </select>
          <input type="submit" value="Ingresar" class="btn btn-primary w-25">
        </form>
      </article>
    </section>

    <section class="container">
      <h2>Tablas</h2>

      <article>
        <h4>Clientes</h4>
        <?php
        $clientesQuery = "SELECT `dniCif`, `nombreCL`, `apellidosCL`, `direccionCL`, `emailCL`, `passCL`, `imagenCL`, `cpCL`, `localidad`, `telefonoCI` FROM `cliente`";
        $clientesQueryRes = mysqli_query($connection, $clientesQuery);
        ?>
        <table class="table-responsive table-bordered m-5 w-100">
          <thead>
            <th>dni</th>
            <th>nombre</th>
            <th>apellidos</th>
            <th>direccion</th>
            <th>email</th>
            <th>password</th>
            <th>imagen</th>
            <th>cp</th>
            <th>localidad</th>
            <th>telefono</th>
          </thead>
          <?php
          foreach ($clientesQueryRes as $key => $value) {
          ?>
            <tbody>
              <td>
                <?php echo $value["dniCif"]; ?>
              </td>
              <td>
                <?php echo $value["nombreCL"]; ?>
              </td>
              <td>
                <?php echo $value["apellidosCL"]; ?>
              </td>
              <td>
                <?php echo $value["direccionCL"]; ?>
              </td>
              <td>
                <?php echo $value["emailCL"]; ?>
              </td>
              <td>
                <?php echo $value["passCL"]; ?>
              </td>
              <td>
                <?php echo $value["imagenCL"]; ?>
              </td>
              <td>
                <?php echo $value["cpCL"]; ?>
              </td>
              <td>
                <?php echo $value["localidad"]; ?>
              </td>
              <td>
                <?php echo $value["telefonoCI"]; ?>
              </td>
            </tbody>
          <?php
          }
          ?>
        </table>
      </article>
      <article>
        <h4>Clientes Seguridad</h4>
        <?php
        $clientesSecQuery = "SELECT `dniCif`, `nombreCL`, `apellidosCL`, `direccionCL`, `emailCL`, `passCL`, `imagenCL`, `cpCL`, `localidad`, `telefonoCI`, `accion`, `fecha` FROM `seguridadcliente`";
        $clientesSecQueryRes = mysqli_query($connection, $clientesSecQuery);
        ?>
        <table class="table-responsive table-bordered m-5 w-100">
          <thead>
            <th>dni</th>
            <th>nombre</th>
            <th>apellidos</th>
            <th>direccion</th>
            <th>email</th>
            <th>password</th>
            <th>imagen</th>
            <th>cp</th>
            <th>localidad</th>
            <th>telefono</th>
            <th>acción</th>
            <th>fecha</th>
          </thead>
          <?php
          foreach ($clientesSecQueryRes as $key => $value) {
          ?>
            <tbody>
              <td>
                <?php echo $value["dniCif"]; ?>
              </td>
              <td>
                <?php echo $value["nombreCL"]; ?>
              </td>
              <td>
                <?php echo $value["apellidosCL"]; ?>
              </td>
              <td>
                <?php echo $value["direccionCL"]; ?>
              </td>
              <td>
                <?php echo $value["emailCL"]; ?>
              </td>
              <td>
                <?php echo $value["passCL"]; ?>
              </td>
              <td>
                <?php echo $value["imagenCL"]; ?>
              </td>
              <td>
                <?php echo $value["cpCL"]; ?>
              </td>
              <td>
                <?php echo $value["localidad"]; ?>
              </td>
              <td>
                <?php echo $value["telefonoCI"]; ?>
              </td>
              <?php
              if ($value["accion"] == "Inserción") {
              ?>
                <td class="bg-info">
                  <?php echo $value["accion"]; ?>
                </td>
              <?php
              } else if ($value["accion"] == "Modificación") {
              ?>
                <td class="bg-warning">
                  <?php echo $value["accion"]; ?>
                </td>
              <?php
              } else {
              ?>
                <td class="bg-danger">
                  <?php echo $value["accion"]; ?>
                </td>
              <?php
              }
              ?>
              <td>
                <?php echo $value["fecha"]; ?>
              </td>
            </tbody>
          <?php
          }
          ?>
        </table>
      </article>

      <!-- PRODUCTS -->
      <article>
        <h4>Producto</h4>
        <?php
        $productosQuery = "SELECT `idProducto`, `dniCif`, `nombreProducto`, `imagenProducto`, `precio`, `descripcion`, `impresion`, `acabado`, `tipoPapel`, `tamanoProducto` FROM `producto`";
        $productosQueryRes = mysqli_query($connection, $productosQuery);
        ?>
        <table class="table-responsive table-bordered m-5 w-100">
          <thead>
            <th>id</th>
            <th>dni</th>
            <th>nombre</th>
            <th>imagen</th>
            <th>precio</th>
            <th>descripcion</th>
            <th>impresion</th>
            <th>acabado</th>
            <th>tipo papel</th>
            <th>tamaño</th>
          </thead>
          <?php
          foreach ($productosQueryRes as $key => $value) {
          ?>
            <tbody>
              <td>
                <?php echo $value["idProducto"]; ?>
              </td>
              <td>
                <?php echo $value["dniCif"]; ?>
              </td>
              <td>
                <?php echo $value["nombreProducto"]; ?>
              </td>
              <td>
                <?php echo $value["imagenProducto"]; ?>
              </td>
              <td>
                $<?php echo $value["precio"]; ?>
              </td>
              <td>
                <?php echo $value["descripcion"]; ?>
              </td>
              <td>
                <?php echo $value["impresion"]; ?>
              </td>
              <td>
                <?php echo $value["acabado"]; ?>
              </td>
              <td>
                <?php echo $value["tipoPapel"]; ?>
              </td>
              <td>
                <?php echo $value["tamanoProducto"]; ?>
              </td>
            </tbody>
          <?php
          }
          ?>
        </table>
      </article>
      <article>
        <h4>Producto Seguridad</h4>
        <?php
        $productosSecQuery = "SELECT `idProducto`, `dniCif`, `nombreProducto`, `imagenProducto`, `precio`, `descripcion`, `impresion`, `acabado`, `tipoPapel`, `tamanoProducto`, `accion`, `fecha` FROM `seguridadproducto`";
        $productosSecQueryRes = mysqli_query($connection, $productosSecQuery);
        ?>
        <table class="table-responsive table-bordered m-5 w-100">
          <thead>
            <th>id</th>
            <th>dni</th>
            <th>nombre</th>
            <th>imagen</th>
            <th>precio</th>
            <th>descripcion</th>
            <th>impresion</th>
            <th>acabado</th>
            <th>tipo papel</th>
            <th>tamaño</th>
            <th>accion</th>
            <th>fecha</th>
          </thead>
          <?php
          foreach ($productosSecQueryRes as $key => $value) {
          ?>
            <tbody>
              <td>
                <?php echo $value["idProducto"]; ?>
              </td>
              <td>
                <?php echo $value["dniCif"]; ?>
              </td>
              <td>
                <?php echo $value["nombreProducto"]; ?>
              </td>
              <td>
                <?php echo $value["imagenProducto"]; ?>
              </td>
              <td>
                $<?php echo $value["precio"]; ?>
              </td>
              <td>
                <?php echo $value["descripcion"]; ?>
              </td>
              <td>
                <?php echo $value["impresion"]; ?>
              </td>
              <td>
                <?php echo $value["acabado"]; ?>
              </td>
              <td>
                <?php echo $value["tipoPapel"]; ?>
              </td>
              <td>
                <?php echo $value["tamanoProducto"]; ?>
              </td>
              <?php
              if ($value["accion"] == "Inserción") {
              ?>
                <td class="bg-info">
                  <?php echo $value["accion"]; ?>
                </td>
              <?php
              } else if ($value["accion"] == "Modificación") {
              ?>
                <td class="bg-warning">
                  <?php echo $value["accion"]; ?>
                </td>
              <?php
              } else {
              ?>
                <td class="bg-danger">
                  <?php echo $value["accion"]; ?>
                </td>
              <?php
              }
              ?>
              <td>
                <?php echo $value["fecha"]; ?>
              </td>
            </tbody>
          <?php
          }
          ?>
        </table>
      </article>

      <!-- EMPLOYEE -->
      <article>
        <h4>Empleados</h4>
        <?php
        $empleadosQuery = "SELECT `dniEmpleado`, `nombreEmp`, `apellidoEmp`, `emailEmp`, `passEmp`, `direccionEmp`, `salario`, `comision`, `telefonoEmp` FROM `empleado`";
        $empleadosQueryRes = mysqli_query($connection, $empleadosQuery);
        ?>
        <table class="table-responsive table-bordered m-5 w-100">
          <thead>
            <th>dni</th>
            <th>nombre</th>
            <th>apellido</th>
            <th>email</th>
            <th>password</th>
            <th>dirección</th>
            <th>salario</th>
            <th>comision</th>
            <th>telefono</th>
          </thead>
          <?php
          foreach ($empleadosQueryRes as $key => $value) {
          ?>
            <tbody>
              <td>
                <?php echo $value["dniEmpleado"]; ?>
              </td>
              <td>
                <?php echo $value["nombreEmp"]; ?>
              </td>
              <td>
                <?php echo $value["apellidoEmp"]; ?>
              </td>
              <td>
                <?php echo $value["emailEmp"]; ?>
              </td>
              <td>
                <?php echo $value["passEmp"]; ?>
              </td>
              <td>
                <?php echo $value["direccionEmp"]; ?>
              </td>
              <td>
                $<?php echo $value["salario"]; ?>
              </td>
              <td>
                $<?php echo $value["comision"]; ?>
              </td>
              <td>
                <?php echo $value["telefonoEmp"]; ?>
              </td>
            </tbody>
          <?php
          }
          ?>
        </table>
      </article>
      <article>
        <h4>Empleados Seguridad</h4>
        <?php
        $empleadosSecQuery = "SELECT `dniEmpleado`, `nombreEmp`, `apellidoEmp`, `emailEmp`, `passEmp`, `direccionEmp`, `salario`, `comision`, `telefonoEmp`, `accion`, `fecha` FROM `seguridadempleado`";
        $empleadosSecQueryRes = mysqli_query($connection, $empleadosSecQuery);
        ?>
        <table class="table-responsive table-bordered m-5 w-100">
          <thead>
            <th>dni</th>
            <th>nombre</th>
            <th>apellido</th>
            <th>email</th>
            <th>password</th>
            <th>dirección</th>
            <th>salario</th>
            <th>comision</th>
            <th>telefono</th>
            <th>acción</th>
            <th>fecha</th>
          </thead>
          <?php
          foreach ($empleadosSecQueryRes as $key => $value) {
          ?>
            <tbody>
              <td>
                <?php echo $value["dniEmpleado"]; ?>
              </td>
              <td>
                <?php echo $value["nombreEmp"]; ?>
              </td>
              <td>
                <?php echo $value["apellidoEmp"]; ?>
              </td>
              <td>
                <?php echo $value["emailEmp"]; ?>
              </td>
              <td>
                <?php echo $value["passEmp"]; ?>
              </td>
              <td>
                <?php echo $value["direccionEmp"]; ?>
              </td>
              <td>
                $<?php echo $value["salario"]; ?>
              </td>
              <td>
                $<?php echo $value["comision"]; ?>
              </td>
              <td>
                <?php echo $value["telefonoEmp"]; ?>
              </td>
              <?php
              if ($value["accion"] == "Inserción") {
              ?>
                <td class="bg-info">
                  <?php echo $value["accion"]; ?>
                </td>
              <?php
              } else if ($value["accion"] == "Modificación") {
              ?>
                <td class="bg-warning">
                  <?php echo $value["accion"]; ?>
                </td>
              <?php
              } else {
              ?>
                <td class="bg-danger">
                  <?php echo $value["accion"]; ?>
                </td>
              <?php
              }
              ?>
              <td>
                <?php echo $value["fecha"]; ?>
              </td>
            </tbody>
          <?php
          }
          ?>
        </table>
      </article>
    </section>

  </main>

</body>

</html>