Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/problem/', to: 'contents#find_problem'
  resources :contents
end
