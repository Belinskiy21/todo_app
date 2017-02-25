Rails.application.routes.draw do
  root to:'pages#home'
  post '/sign_in', to: 'pages#sign_in'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only: [:show,:new, :create] do
resources :lists, only: [:new,:create]
end

end
