Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  
  get 'search', to: 'articles#index'
	resources :articles do
  		resources :comments
	end

	# /comments i comments contollerindeki index metoduna döndürür
	get 'comments/index', to: 'comments#index'
	
end
