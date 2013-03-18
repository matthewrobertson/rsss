Rsss::Application.routes.draw do

  match 'links(.:format)',     to: 'links#index',  :via => [:get, :options], as: 'links'
  match 'links(.:format)',     to: 'links#batch',  :via => [:post]
  match 'links/:id(.:format)', to: 'links#show',   :via => [:get, :options], as: 'link'
  match 'links/:id(.:format)', to: 'links#update', :via => [:post]

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  match 'stream', to: 'stream#index'

  root to: 'home#index'

end