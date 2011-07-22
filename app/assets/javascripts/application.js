// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery-ui
$(document).ready(function(){

$('#p_contact').click(function(){
	 $('#contact_panel').toggle();
	 $('#contact_image').rotate(-180);
})


$('#p_implantation').click(function(){
	 $('#implantation_panel').toggle();
})

$('#p_testimonial').click(function(){
	 $('#testimonial_panel').toggle();
})

$('#p_social').click(function(){
	 $('#social_panel').toggle();
})


$("input[data-autocomplete]").railsAutocomplete()}),function(a){var b=null;a.fn.railsAutocomplete=function(){return this.live("focus",function(){this.railsAutoCompleter||(this.railsAutoCompleter=new a.railsAutocomplete(this))})},a.railsAutocomplete=function(a){_e=a,this.init(_e)},a.railsAutocomplete.fn=a.railsAutocomplete.prototype={railsAutocomplete:"0.0.1"},a.railsAutocomplete.fn.extend=a.railsAutocomplete.extend=a.extend,a.railsAutocomplete.fn.extend({init:function(a){function c(a){return b(a).pop().replace(/^\s+/,"")}function b(b){return b.split(a.delimiter)}a.delimiter=$(a).attr("data-delimiter")||null,$(a).autocomplete({source:function(b,d){$.getJSON($(a).attr("data-autocomplete"),{term:c(b.term)},function(){$(arguments[0]).each(function(b,c){var d={};d[c.id]=c,$(a).data(d)}),d.apply(null,arguments)})},search:function(){var a=c(this.value);if(a.length<2)return!1},focus:function(){return!1},select:function(c,d){var f=b(this.value);f.pop(),f.push(d.item.value);if(a.delimiter!=null)f.push(""),this.value=f.join(a.delimiter);else{this.value=f.join(""),$(this).attr("id_element")&&$($(this).attr("id_element")).val(d.item.id);if($(this).attr("data-update-elements")){var g=$(this).data(d.item.id.toString()),h=$.parseJSON($(this).attr("data-update-elements"));for(var i in h)$(h[i]).val(g[i])}}var j=this.value;$(this).bind("keyup.clearId",function(){$(this).val().trim()!=j.trim()&&($($(this).attr("id_element")).val(""),$(this).unbind("keyup.clearId"))}),$(this).trigger("railsAutocomplete.select");return!1}})}})}(jQuery)

var TagField = function(selector){ 
	
	var input = $(selector);
	var tags = input.hide().val().split(',');

	$.each(tags, function(){
		create_tag(this);
	});

	var add_tag_input = $('<input type="text" placeholder="Nouveau tag" class="add_tag" />');
	input.after(add_tag_input);

	add_tag_input.autocomplete({
		source: input.attr('data-url'),
		select: function(e){
			create_tag_from_input($(e.target));
		}
	});

	add_tag_input.keypress(function(e){
		if(e.keyCode == 13){
			e.preventDefault();
			create_tag_from_input($(e.target));
		}
	});
	
	function create_tag_from_input(current_input){
		create_tag(current_input.val());
		current_input.val('');
		update_tags();
	}

	function create_tag(name){
		if(name.trim().length > 0){
			var tag = $('<span class="tag"><span class="name">'+ name.trim() +'</span><a href="#">X</a></span>');
			input.before(tag);

			tag.find('a').click(function(e){
				e.preventDefault();
				$(e.target).parents('span.tag').remove();
				update_tags();
			});
		}
	}

	function update_tags(){
		var tags = [];
		$('span.tag span.name').each(function(){
			tags.push($(this).html());
		});
		input.val(tags.join(', '));
	}
};

String.trim = function(){
	return $.trim(this);
}