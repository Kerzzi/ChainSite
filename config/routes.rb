Rails.application.routes.draw do
  
  devise_for :users
  root 'welcome#index'
  
  resources :sites
  resources :site_nodes
  resources :article_categories
  resources :articles
  
  namespace :admin do
    resources :site_nodes
    resources :sites
    resources :article_categories
    resources :articles
  end
end
