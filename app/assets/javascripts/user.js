function Blurb (){
	this.id = window.location.pathname.slice(7);
	this.follow = $(document).find('.follow');
	this.unfollow = $(document).find('.unfollow');
	var self = this;

	$(this.follow).on('submit', function(e){
		e.preventDefault();
		$.ajax({
			url: "/follows/follow",
			method: 'POST',
			data: { id: self.id }
		}).done(function(data){
			$(self.follow).addClass('hidden');
			$(self.unfollow).removeClass('hidden');
		});
	});

	$(this.unfollow).on('submit', function(e){
		e.preventDefault();
		$.ajax({
			url: "/follows/unfollow",
			method: 'POST',
			data: { id: self.id }
		}).done(function(data){
			$(self.unfollow).addClass('hidden');
			$(self.follow).removeClass('hidden');
		});
	});
}

$(document).ready(function(){	
	var blur = new Blurb
});
