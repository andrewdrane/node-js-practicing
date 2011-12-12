<!DOCTYPE html>
<html>
<head>
  <title>Polling <?php// echo h($title_for_layout); ?></title>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="/css/cake.generic.css" />
</head>
<body>
  
  <div id="header_container">
    <div id="header">
      <h1>Jobber Ware</h1>
    </div>
  </div>
    
  <div id="container">
    <?php if(isset($content_for_layout)) echo $content_for_layout; ?>
  </div>

  <div id="footer_container">
    <div id="footer">
      <h3>FOOTAH</h3>
    </div>
  </div>

</body>
</html>
