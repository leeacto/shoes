$.ready(function(){
	$('.users').on('click', '.button_to', function(e){
		e.preventDefault();
		var url = '';
		var user_id = 
		if(this.text === 'Follow') {
			url = 'user_follows_path'
		} else {
			url = 'user_follow_path'
		}
		$.ajax({
			url: url,
			method: 'POST',
			data: { id: user_id }
		});
	});
});
