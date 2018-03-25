Rails.application.routes.draw do

  devise_for :users
  root 'sites#index'

  resources :sites
  resources :site_nodes
  resources :article_categories
  resources :articles
  resources :projects

  namespace :admin do
    root to: 'sites#index', as: 'root'
    resources :site_nodes do
      collection do
        post :bulk_update
      end
    end
    resources :sites do
      collection do
        post :bulk_update
      end
    end
    resources :article_categories do
      collection do
        post :bulk_update
      end
    end
    resources :articles do
      collection do
        post :bulk_update
      end
    end
    resources :projects do
      collection do
        post :bulk_update
      end
    end
    resources :users do
      collection do
        post :bulk_update
      end      
    end
  end
end
