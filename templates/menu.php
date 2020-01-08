        <div class="menu">
            <p>Menu</p>
            <ul>
                <li><a href="">Главная</a></li>
                <li><a href="catalog/">Каталог</a></li>
                <li><a href="article/">Статьи</a></li>                
                <li><a href="contact/">Контакты</a></li>
                <li><a href="feedback/">Отзывы</a></li>
            </ul>
        </div>
        
        <div class="open">
        <div id="autorize">
            <?php include 'auth.php' ?>
        </div>
        <br>
        <div class="basket" id="basket">
        <p>Наименований товаров в корзине: <span id="basket_count_good"></span><br>
        Всего товаров: <span id="basket_count"></span><br>
        на сумму: <span id="basket_price"></span> рубль</p>
        <input type="button" id="clear_basket"  value="Очистить корзину" onclick="clear_basket()"></center>
        </div>        
        </div>
        
