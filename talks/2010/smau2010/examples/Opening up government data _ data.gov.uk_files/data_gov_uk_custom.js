$(document).ready(function(){

	$("#edit-field-homepage-0-url, #edit-field-linkedin-0-url, #edit-field-facebook-0-url, #edit-field-github-0-url, #edit-field-flickr-0-url, #edit-field-data-set-url-0-value, #edit-field-data-set-url-0-value, #edit-field-app-url-0-value").bind("focus", function(e){
		var v = e.currentTarget.value;
		if (e.currentTarget.value == ''){
			e.currentTarget.value = 'http://';
		}
	});
	$("#edit-field-homepage-0-url, #edit-field-linkedin-0-url, #edit-field-facebook-0-url, #edit-field-github-0-url, #edit-field-flickr-0-url, #edit-field-data-set-url-0-value, #edit-field-data-set-url-0-value, #edit-field-app-url-0-value").bind("blur", function(e){
		var v = e.currentTarget.value;
		if (e.currentTarget.value =='http://'){
			e.currentTarget.value = '';	
		}
	});
	
	var searchText='What are you looking for?';
	$("#edit-search-theme-form-1").val(searchText);
		
	$("#edit-search-theme-form-1").bind("focus", function(e){
		if (e.currentTarget.value == searchText) {
			e.currentTarget.value = '';
		}
	});
	
	$("#edit-search-theme-form-1").bind("blur", function(e){
		if (e.currentTarget.value == '') {
			e.currentTarget.value = searchText;
		}
	});
}
);