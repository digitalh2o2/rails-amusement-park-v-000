Rails.application.routes.draw do

	root 'welcome#home'

	resources :users, :sessions

	get '/signin', to: 'sessions#new'
	post '/signin', to: 'sessions#create'
	delete '/sign_out', to: 'sessions#destroy'
end