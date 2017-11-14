Rails.application.routes.draw do
  root 'welcome#index'
  get 'weather', to: 'weather#index'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
