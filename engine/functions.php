<?php

//Константы ошибок
define('ERROR_NOT_FOUND', 1);
define('ERROR_TEMPLATE_EMPTY', 2);


//Функция получает переменные в зависимости от выбранной страницы. news или newspage или feedback

function prepareVariables($page_name) 
{
	switch ($page_name){
	
		case "index":
			$vars['content'] = '../templates/index.php';
			$vars['title'] = SITE_TITLE . "Главная страница";
			$vars['new_product'] = NewProduct();
			$vars['top_product'] = TopProduct();
			$vars['sale_product'] = SaleProduct();
		break;
		
		case "contact":
		
		break;
		
		case "register":
			$vars['content'] = '../templates/register.php';
			$vars['title'] = SITE_TITLE . "Регистрация";
			$vars['new_product'] = NewProduct();
			$vars['top_product'] = TopProduct();
			$vars['sale_product'] = SaleProduct();
		break;	
		
		case "feedback":
		
		break;
	}
	
	
	return $vars;
}

function NewProduct()
{
	$sql = 'SELECT * FROM goods ORDER BY date DESC LIMIT 6;';
	return getAssocResult($sql);
}

function TopProduct()
{
	$sql = 'SELECT * FROM goods ORDER BY view DESC, date DESC LIMIT 3;';
	return getAssocResult($sql);
}

function SaleProduct()
{
	$sql = 'SELECT * FROM goods ORDER status = "2" order BY view DESC LIMIT 3;';
	return getAssocResult($sql);
}

?>
