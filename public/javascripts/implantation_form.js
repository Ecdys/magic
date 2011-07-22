$(document).ready(function(){
	
	var field = $('#implantation_address');
	var value = field.val();
	var geocoder = new google.maps.Geocoder();
	
	check_address();
	
	
	function check_address(){
		
		window.setTimeout(function(){
			
			if(value != field.val() && field.val().length > 3){
				value = field.val();
				
				geocoder.geocode({ address: field.val() }, function(results, status){
					display_addresses(results);
					check_address();
				});
			}
			else check_address();
			
		}, 500);
	}
	
	function display_addresses(results){
		
		if($('ul#addresses').length == 0){
			var list = $('<ul id="addresses" />');
			field.parents('div.string').after(list);
		}
		else {
			var list = $('ul#addresses').html('');
		}
		
		var item;
		for(var i=0; i<results.length; i++){
			item = $('<li><a href="#">'+ results[i].formatted_address +'</a></li>');
			item.find('a').data('object', results[i]);
			list.append(item);
		}
		
		list.find('a').click(function(e){
			e.preventDefault();
			fill_address($(e.target).data('object'));
			list.remove();
		});
		
	}
	
	function fill_address(address){
		$('#implantation_latitude').val(address.geometry.location.Ka);
		$('#implantation_longitude').val(address.geometry.location.La);
		
		var datas = {};
		for(var i=0; i<address.address_components.length; i++){
			datas[address.address_components[i].types[0]] = address.address_components[i];
		}
		console.log(datas);
		
		if(datas.street_number && datas.route){
			$('#implantation_street_address').val(datas.street_number.short_name + ' ' + datas.route.long_name);
		}
		
		if(datas.administrative_area_level_1){
			$('#implantation_administrative_area_level_1').val(datas.administrative_area_level_1.long_name);
		}
		
		if(datas.administrative_area_level_2){
			$('#implantation_administrative_area_level_2').val(datas.administrative_area_level_2.long_name);
		}
		
		if(datas.administrative_area_level_3){
			$('#implantation_administrative_area_level_3').val(datas.administrative_area_level_3.long_name);
		}
		
		if(datas.locality){
			$('#implantation_locality').val(datas.locality.long_name);
		}
		
		if(datas.postal_code){
			$('#implantation_postal_code').val(datas.postal_code.long_name);
		}
		
		if(datas.country){
			$('#implantation_country').val(datas.country.long_name);
		}
		
	}
	
	
});