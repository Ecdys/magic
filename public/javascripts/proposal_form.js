$(document).ready(function(){
	
	var input = new TagField('#proposal_tag_list');
	
	var clone = $('li.new_doc').first().clone(true);
	
	$('form input[type=file]').bind('change', function(e){
		$('#add_doc').trigger('click');
	});
	
	$('#add_doc').click(function(e){
		e.preventDefault();
		
		var form = clone.clone();
		
		form.find(':input').each(function(){
			var name = $(this).attr('name');
			var index = $('#documents li').length;
			
			$(this).attr('name', name.replace(/_attributes\]\[[0-9]+\]/g, '_attributes]['+index+']'));
			$(this).attr('id', $(this).attr('id').replace(/attributes_[0-9]+/g, 'attributes_'+index));
		});
		
		form.find('input[type=file]').bind('change', function(e){
			$('#add_doc').trigger('click');
		});
		
		$('#documents').append(form);
	});
	
});
