        <div class="namecat"><h2 class="namecat">Top products</h2></div>
        
        <!-- Лучшая продукция -->
         <div class="tovar">
        <? foreach ($content['top_product'] as $item): ?>
            <div class="product">
                <a href="good/<?=$item['id_good']?>/"><img src="<?=$item['foto']?>"></a>
                <table class="tov">
                    <tr>
                        <td class="naming"><?=$item['name']?></td>
                        <td class="pricem">€<?=$item['price']?></td>
                    </tr>
                </table>
            </div>
            <? endforeach; ?>
        </div>
