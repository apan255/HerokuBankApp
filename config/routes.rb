Rails.application.routes.draw do

  resources 'pendtransactions'

  resources 'transfers'

  resources 'withdraws'

  resources :deposits

  resources :searches

  resources :transactions

  resources :friends

  resources :accounts
  resources :accountreqs

  get 'sessions/new'

  resources :admins

  resources :users
  root 'sessions#new'
  get    '/transhistory',  to: 'pendtransactions#history'
  get '/',  to: 'accountreqs#reject'
  get    '/add_friends',  to: 'searches#show'
  get    '/show_account',  to: 'accounts#show'
  get    '/add_friends',  to: 'searches#index'
  get    '/account_reqs',  to: 'accountreqs#index'
  get    '/home_page',  to: 'users#show'
  get    '/create_users',  to: 'users#new'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'


  resources :account do
    member do
      post 'deposit'
    end
  end

  resources :accountreqs do
    member do
      get 'reject'
    end
  end

  resources :friend do
    member do
      post 'search'
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
