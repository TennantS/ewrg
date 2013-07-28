Ewrg::Application.routes.draw do

  match '/signup',                to: 'users#new'
  match '/signin',                to: 'sessions#new'
  match '/signout',               to: 'sessions#destroy', via: :delete
end
