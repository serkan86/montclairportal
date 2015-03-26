Rails.application.routes.draw do


  mount RedactorRails::Engine => '/redactor_rails'
  resources :forums do
    resources :topics do
      resources :posts
    end
  end

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"

  devise_for :admins, controllers: {sessions: 'hq/sessions'}, path: 'hq',
             path_names: {sign_in: 'login', sign_out: 'logout', password: 'secret',
                          confirmation: 'verification'}
  devise_for :users
  root to: 'welcome#index'

      resource :user_profile, except: [:destroy], path: 'profile'

  namespace :hq do
      root to: 'dashboard#index'
      resource :admin_profile, except: [:destroy], path: 'profile'
      resources :dashboard, only: [:index]
    resources :forums
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

      resource :user_profile, except: [:destroy], path: 'profile'


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

  resources :blogs, path: 'blog'
  resources :users do
    resources :blogs, path: 'blog', only: [:index, :show]
  end
end
