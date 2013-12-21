Shoes::Application.routes.draw do
  root 'pages#index'
	resources :users
	get '/login', :to => 'sessions#create'
end
