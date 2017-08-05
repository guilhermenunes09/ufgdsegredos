	// Assign handlers immediately after making the request,
	// and remember the jqXHR object for this request
	var jqxhr = $.ajax( "ajax/getInbox.php" )
	  	.done(function(data) {
	  	//$(".contentAjax1").html(data);
	  	getMessages();
	    
	})
	.fail(function() {
	    
	})



	 // Assign handlers immediately after making the request,
	// and remember the jqXHR object for this request
	function getMessages(){
		
		var jqxhr = $.ajax( "ajax/getMessages.php" )
		  .done(function(data) {
		  	$(".contentAjax2").html(data);
		    
		  })
		  .fail(function() {
		    
		  })
	}



	  $(document).unbind().on('click', '.send', function(event){
	  	event.preventDefault();
	   
	   	var id = $(this).val();
	   	 $(this).prop("disabled",true);
	   
		alias = $(this).attr('alias');
		num = $(this).attr('num');
		
		messagepublish = '';
		message='';
		aftermessage='';
		for(i=0;i<num;i++){
			thisId = alias+"-"+i;
			
			if(i==0){
				premessage = $('#pre'+thisId).html();
			}
			message += " " + $('#'+thisId).html();
			if(i==num-1){
				aftermessage += " " + $('#af'+thisId).html();
			}
		}


		messagepublish = premessage + $.trim(message) + $.trim(aftermessage);
		
		
		$.ajax('ajax/post.php', { data: { id: id, message: messagepublish },
		    type: "POST",
		    beforeSend: function() {
		        interval = setInterval(getMessages, 100);
		    },
		    error: function() {
		        alert("error"); 
		    },
		    success: function(data) {
		       //$(".contentAjax2").html(data);   j
		       console.log("pronto");
		       clearInterval(interval);
		    }
		});	
	  });


	  $(document).on('click', '#delete-msg', function(event){
	  	event.preventDefault();
	    //Your code
	    id = $(this).attr('alias'); // or var clickedBtnID = this.id
	    pos = $(this).attr('pos');
	    console.log(id);

	     if (confirm('Tem certeza que deseja apagar essa linha?')) {
		    $.ajax('ajax/deleteLine.php', { data: { id: id, pos: pos },
			    type: "POST",
			  
			    success: function(data) {
			       //$(".contentAjax2").html(data);   j
			       console.log(data);
			       
			       getMessages();
			    }
			});	
		}


	  });

	  $(document).on('click', '#dismiss', function(event){
	  	event.preventDefault();
	    //Your code
	    var id = $(this).val(); // or var clickedBtnID = this.id
	    var alias = $(this).attr('alias');
	    if (confirm('Tem certeza que não quer postar a mensagem de '+alias+'?')) {
		    $.ajax('ajax/deleteRow.php', { data: { id: id },
			    type: "POST",
			  
			   
			    success: function(data) {
			       //$(".contentAjax2").html(data);   j
			       console.log(data);
			       
			       getMessages();
			    }
			});	
		}


	  });

	  function wordInString(s, word){
	  	console.log(s);
	  	console.log(word);
  		return new RegExp( '\\b' + word + '\\b', 'i').test(s);
	 }

	  function data(){
	   $(function() {

	   		phref = $("#phref").val();
	   		show = '"'+ phref;

	   		for(i=0;i<20;i++)
	   		{
	   			num = $("#send"+i).attr('num');

	   			for(j=0;j<num;j++)
	   			{
	   				
	   				fId = i+'-'+j;
	   				if($('#'+fId).html()==''){
	   					$('.panel'+fId).hide();
	  				}

	   				text = text = $('#'+fId).html();

	   				$("#pre"+fId).html('"');
	   				$("#af"+fId).html('"');
	   				var findConfesso = text.toLowerCase().indexOf("confesso");
	   				if(num==1) {
						if (!(findConfesso >-1 && findConfesso<=19)) {
							$("#pre"+fId).html(show);
						}
	   				} else {
	   					if(j==0){
				    		if (!(findConfesso >-1 && findConfesso<=19)) {
								$("#pre"+fId).html(show);
							}
							$("#af"+fId).html('');
	   					}
	   					if(j==num-1){
	   						$("#pre"+fId).html('');
	   						$("#af"+fId).html('"');
	   					}
	   				}
	   			}
	   			
	   			
	   		}


	   		/*
	   		for(i=0;i<20;i++)
	   		{
	    		text = $("#message"+i).html();
	    		phref = $("#phref").val();

	    		if(text){
	    			num = $("#send"+i).attr('num');
	    			console.log(num);
	    			alias = $("#send"+i).attr('alias');
	    			var findConfesso = text.toLowerCase().indexOf("confesso");
	    			if(num==1) {
	    				//console.log(num);
	    					phref = $("#phref").val();
				    		show = '"'+ phref;
				    		$("#premessage"+i).html(show);
							$("#aftermessage"+i).html(num);
	    			} else {
	    				if(i==alias) {
	    					//console.log(alias-num+1);
	    					aliasId = alias-num+1;
				    		show = '"'+ phref;
				    		$("#premessage"+aliasId).html(show);
				    	}
				    		

	    			}			
		    			
			    		//if (findConfesso >-1 && findConfesso<=19) {
				 
						
				}		*/		
    		
    		
  		});

	  }
	  $(document).ready(function() {
	  	getMessages();
	  	   $("#phref").attr('maxlength','15');
		   $('#phref').on('input', function() {
	    	  data();
			});
	  });

	  



		 