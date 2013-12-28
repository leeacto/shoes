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
	(this.el).find('.button_to').on('submit', function(e){
		e.preventDefault();
		var url = '';
		var user_id = '';
		//This URL is wrong. write out full URL not path
		if(this.text === 'Follow') {
			url = 'user_follows_path';
		} else {
			url = 'user_follow_path';
		}
		$.ajax({
			url: url,
			method: 'POST',
			data: { id: user_id }
		});
	});
}

$(document).ready(function(){	
	myTable = new userTable('.users');
});
