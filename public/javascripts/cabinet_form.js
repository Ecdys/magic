$(document).ready(function(){
	var input = new TagField('#cabinet_tag_list');
	
	$('#get_infos').click(function(e){
		
		$('#societe-com-list').remove();
		$('#societe-com-message').remove();
		
		$.ajax({
			type: 'get',
			url: get_url('search', { nom: $('#cabinet_name').val() }),
			success: function(response){
				var results = response.getElementsByTagName('result');
				
				if(results.length == 0){
					$('#get_infos').after('<p id="societe-com-message">Aucun résultat correspondant.</p>');
				}
				else if(results.length == 1){
					fill_form(results[0].getElementsByTagName('siren')[0].firstChild.nodeValue);
				}
				else {
					var list = $('<ul id="societe-com-list" />');
					var item;
					
					for(var i=0; i<results.length; i++){
						item = $('<li><strong>'+ results[i].getElementsByTagName('rs')[0].firstChild.nodeValue +'</strong>, '+ results[i].getElementsByTagName('cp')[0].firstChild.nodeValue +' (<span class="id">'+ results[i].getElementsByTagName('siren')[0].firstChild.nodeValue +'</span>) <input type="button" value="Choisir" /></li>');
						list.append(item);
					}
					
					list.find('input[type=button]').click(function(e){
						fill_form($(e.target).parents('li').find('span.id').html());
						$('#societe-com-list').remove();
					});
					
					$('#get_infos').after(list);
				}
			}
		});
		
	});
	
	function fill_form(siren){
		$.ajax({
			type: 'get',
			url: get_url('profile', { siren: siren }),
			success: function(response){
				console.log(response);
				
				$('#cabinet_siret').val(response.getElementsByTagName('no')[0].firstChild.nodeValue);
				
				var date = response.getElementsByTagName('dateimmat')[0].firstChild.nodeValue.split('-');
				$('#cabinet_creation_date_3i').val(parseInt(date[0]));
				$('#cabinet_creation_date_2i').val(parseInt(date[1]));
				$('#cabinet_creation_date_1i').val(parseInt(date[2]));
			}
		});
	}
	
	function get_url(type, params){
		
		var options = {
			type: 'application/xml'
		};
		
		switch(type){
			case 'search': options.url = 'http://partxml.societe.com/cgi-bin/listexml'; break;
			case 'profile': options.url = 'http://partxml.societe.com/cgi-bin/detxmlraf'; break;
		}
		
		options.params = $.param($.extend({
			user: 'testcli',
			pass: 'clitestxml'
		}, params));
		
		console.log(options.params);
		
		return '/proxy?' + $.param(options);
	}
	
});