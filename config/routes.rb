Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  require "sidekiq/web"
  mount Sidekiq::Web, at: '/sidekiq'
  root 'welcome#index'



  namespace :api, path: '/', constraints: {subdomain: 'api'} do
    resources :accounts
    resources :domains
  end

end
