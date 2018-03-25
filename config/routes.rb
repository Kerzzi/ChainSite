Rails.application.routes.draw do

  devise_for :users
  root 'sites#index'

  resources :sites
  resources :site_nodes
  resources :article_categories
  resources :articles
  resources :projects

  namespace :admin do
    resources :site_nodes
    resources :sites
    resources :article_categories
    resources :articles
    resources :projects
  end
end
