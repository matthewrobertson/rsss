Rsss::Application.routes.draw do

  match 'links(.:format)',     to: 'links#index',  :via => [:get], as: 'links'
  match 'links(.:format)',     to: 'links#batch',  :via => [:post]
  match 'links/:id(.:format)', to: 'links#show',   :via => [:get], as: 'link'
  match 'links/:id(.:format)', to: 'links#update', :via => [:post]
  match 'links(/:id(.:format))', to: 'links#options', :via => [:options]

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  root to: 'home#index'

end