Rails.application.routes.draw do
  post 'update', to: 'users#update'
  get 'login', to: 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'welcome#index'
  get 'weather', to: 'weather#index'
  get 'news', to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
