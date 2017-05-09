jQuery("#recommend-kinds").change(function(){
	var kinds = jQuery(this).val();
	if(kinds == "h5"){
		jQuery("#native_value").hide();
	} else {
		jQuery("#native_value").show();
	}
});

jQuery("#recommend-type input").click(function(){
	var type = jQuery(this).val();
	if(type == 1){
		jQuery("#headimage_div").hide();
	} else {
		jQuery("#headimage_div").show();
	}
});
$( function() {
	$( "#sortable" ).sortable({
		placeholder: "ui-state-highlight"
	});
	$( "#sortable" ).disableSelection();
} );
