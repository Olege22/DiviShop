// JavaScript Document
	console.log('hello!');

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
            $('#autorize').html(response);
        },
		error: function (jqXHR, textStatus, errorThrown) {
            //debugger;
            //alert(jqXHR, textStatus, errorThrown);
            console.log('jqXHR:',jqXHR, textStatus, errorThrown);
        }/*,
        complete: function(a,b) {
			console.log("jqXHR="+a.responseXML," textStatus="+b);
        }*/,
		dataType:"text"
    });
};




