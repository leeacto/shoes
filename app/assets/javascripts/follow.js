function userTable (el) {
	this.el = $(el);
	this.users = new Array;
	this.loadUsers();
	this.current_user = '';
}

userTable.prototype.loadUsers = function (){
  var	self = this;
	$(this.el).children().each(function(){
		if (this.id) {
			if ($('#' + this.id).find('.follow').length) {
				self.users.push(new Blurb(this.id, self))	
			} else {
				self.current_user = this.id;
			}
		}
	});
	
	this.assign_current_user();
}

userTable.prototype.assign_current_user = function(){
	var self = this;
	$.each(self.users, function(i){
	  self.users[i].current_user = self.current_user;	
	});
}

function Blurb (el, table) {
	this.table = table;
	this.current_user = table.current_user;
	this.el = $('#' + el);
	this.id = el;
	this.follow = this.el.find('.follow');
	this.unfollow = this.el.find('.unfollow');
	var self = this;
	$(this.follow).on('submit', function(e){
		e.preventDefault();
		$.ajax({
			url: "users/" + self.current_user + "/follows/",
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
			url: "users/" + self.current_user + "/follows/unfollow",
			method: 'POST',
			data: { id: self.id }
		}).done(function(data){
			$(self.unfollow).addClass('hidden');
			$(self.follow).removeClass('hidden');
		});
	});
}

$(document).ready(function(){	
	myTable = new userTable('.users');
});
