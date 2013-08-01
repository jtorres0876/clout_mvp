CloutMvp::Application.routes.draw do

  resources :artists
  resources :listeners
  resources :tracks
  resources :shares,    only: [:new, :create, :index]
  resources :sessions,  only: [:new, :create, :destroy]
  

  root to: 'static_pages#home'

  match 'auth/facebook/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy'

  match 'help',          to: 'static_pages#help'
  match 'about',         to: 'static_pages#about'
  match 'contact',       to: 'static_pages#contact' 
  match 'signup',        to: 'listeners#new'
  match 'artist_portal', to: 'static_pages#artist_portal'
  match 'tuneclout',     to: 'static_pages#tuneclout'
  #match "tracks/upload", :as => "upload"
  #match 'artistsignup',  to: 'artists#new'
  #match '/artistsignin',  to: 'artist_sessions#new'
  #match '/artistsignout', to: 'artist_sessions#destroy', via: :delete    

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
