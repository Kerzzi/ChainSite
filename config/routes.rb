Rails.application.routes.draw do
  
  devise_for :users
  root 'welcome#index'
  
  resources :sites
  resources :site_nodes
  
  namespace :admin do
    resources :site_nodes
    resources :sites
  end
end
