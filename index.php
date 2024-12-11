<!DOCTYPE html>
<html lang="es">

<?php
  require_once 'config/global.php';
  require_once 'views/layout/header.php'; 
  ?>

<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="<?= BASE_DIR; ?>public/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <?php require_once 'views/layout/navbar.php'; ?>
  <?php require_once 'views/layout/menu.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    
    <!-- /.content -->
  </div>
 <?php require_once 'views/layout/footer.php'; ?>.
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="<?= BASE_DIR; ?>public/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<?= BASE_DIR; ?>public/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="<?= BASE_DIR; ?>public/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="<?= BASE_DIR; ?>public/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="<?= BASE_DIR; ?>public/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="<?= BASE_DIR; ?>public/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="<?= BASE_DIR; ?>public/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="<?= BASE_DIR; ?>public/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="<?= BASE_DIR; ?>public/plugins/moment/moment.min.js"></script>
<script src="<?= BASE_DIR; ?>public/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="<?= BASE_DIR; ?>public/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="<?= BASE_DIR; ?>public/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="<?= BASE_DIR; ?>public/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="<?= BASE_DIR; ?>public/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<?= BASE_DIR; ?>public/dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<?= BASE_DIR; ?>public/dist/js/pages/dashboard.js"></script>
</body>
</html>
