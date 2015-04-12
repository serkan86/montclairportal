Rails.application.routes.draw do

  concern :commentable do
    resources :comments
  end

  authenticated :user do
    root :to => 'welcome#wall', as: 'authenticated'
  end

  unauthenticated :user do
    root :to => 'welcome#index'
  end

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

  namespace :hq do
      root to: 'dashboard#index'
      resource :admin_profile, except: [:destroy], path: 'profile'
      resources :dashboard, only: [:index]
    resources :forums
  end

  resources :messages
  resources :blogs, path: 'blog'
  resources :users, concerns: [:commentable] do
    resources :blogs, path: 'blog', only: [:index, :show]
  end

  resources :followees, only: [:create, :destroy]
end
