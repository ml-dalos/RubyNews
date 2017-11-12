Rails.application.routes.draw do
  get 'weather/index'
  devise_for :users
  root 'welcome#index'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
