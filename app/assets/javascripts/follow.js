function userTable (el) {
	this.el = $(el);
	this.users = new Array;
	this.loadUsers();
}

userTable.prototype.loadUsers = function (){
  var	self = this;
	$(this.el).children().each(function(){
		if (this.id) {
		  self.users.push(new Blurb(this.id))	
		}
	});
}

function Blurb (el) {
	this.el = $('#' + el);
	this.id = el;
	this.follow = this.el.find('.follow');
	this.unfollow = this.el.find('.unfollow');
	var self = this;
	(this.follow).on('submit', function(e){
		e.preventDefault();
		var url = (this.action).substring((this.action).indexOf('user'),(this.action).indexOf('?'));
		$.ajax({
			url: url,
			method: 'POST',
			data: { id: self.id }
		}).done(function(url){
		console.log(url);
		});
	});
}

$(document).ready(function(){	
	myTable = new userTable('.users');
});
