<!DOCTYPE html>
<html>
  <?php include 'head.php' ?>


  <body>
    <?php include 'header.php' ?>

    <!-- Основной блок -->
    <div class="main">
    
    <!-- Левый блок -->
    <div class="left">
      
      <!-- Меню -->
  		<?php include 'menu.php' ?>
      
      <div class="open">
        <p>now<br>is<br>open!</p>
      </div>
      
    </div>
      
    <!-- Правый блок -->
    <div class="right">

  		<?php include $content['content']; ?>

      
    </div>
      
    <!-- Нижняя часть главного блока -->
  	<?php include 'brand.php' ?>
      
  	<?php include 'instagram.php' ?>
    
     <?php include 'network.php' ?>
    
    </div>
    
  	<?php include 'footer.php' ?>

<!--     <script type="text/javascript" src="../public/js/ajax.js"></script>
   <script type="text/javascript" src="../public/js/checking.js" ></script>-->

<script type="text/javascript">
  
  function register(){
  //console.log('hello register!');
    const login = encodeURI(document.
    getElementById('login').value);
  const password = encodeURI(document.
    getElementById('pass').value);
  const rememberme = encodeURI(document.getElementById
    ('rememberme').checked);
  //console.log("login="+login,"password="+password);
  const rememberme2 = encodeURI(document.getElementById
    ('rememberme').checked);
    $.ajax({ 
      type: 'POST', 
      url: 'index.php', 
      data: { metod: 'ajax', 
        PageAjax: 'register', 
        var3: rememberme2, 
        login: login, 
        pass: password, 
        rememberme: rememberme}, 
      success: function(response){
            //console.log(response);
            $('#autorize').html(response);
        },
    error: function (jqXHR, textStatus, errorThrown) {
            //debugger;
            //alert(jqXHR, textStatus, errorThrown);
            console.log('jqXHR:', jqXHR, textStatus, errorThrown);
        }/*,
        complete: function(a,b) {
      console.log("jqXHR="+a.responseXML," textStatus="+b);
        }*/,
    dataType:"json"
    });
};

</script>
  </body>
  
</html>