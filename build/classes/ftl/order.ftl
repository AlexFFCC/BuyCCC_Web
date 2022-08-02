<!DOCTYPE html>
<html>
    <head>
        <title> ${title} </title>
        <meta charset="UTF-8">
    </head>

    <body>
    
    <p>
      <h3>${memberName}  你好! 感謝您的訂購</h3>
    </p>
    
    <table>
    		
    			<tr>
		    		<th>訂購人</th>
		    		<th>訂單日期時間</th>
		    		<th>送貨地址</th>
		    		
		    		<th>訂單總金額</th>
		    	</tr>
		    	
		    	
		    	
		    	
			    	<tr>
			    		<td>${orderName}</td>
			    		
			    		<td>${oderdate} ${orderTime}</td>
			    		
			    		
			    		<td>${addr}</td>
			    		
			    		
			    		<td>${amount}</td>
			    		

			    	</tr>
			    	
    		
    	</table>
    <p>感謝您的訂購!</p>
    <a href='http://${host}:8080/b3c'><img src='cid:image'></a>
    </body>
</html>
