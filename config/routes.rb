Shoes::Application.routes.draw do
  root 'pages#index'
	resources :users do
		resources :pairs
		resources :follows
	end

	resources :sessions, only: [:create]
	get '/login', :to => 'sessions#new'
	get '/logout', :to => 'sessions#destroy'
end
