Prueba::Application.routes.draw do
  resources :comms

  resources :archivos

  resources :comments

  resources :posts

  resources :cursos

  get "registrations_controller/update"

  resources :teachers

  resources :students

  resources :admins

  devise_for :users, :admins, :students, :teachers

  resources :users

match '/comments/new/:id_post' 	=> 'comments#new'
match '/comms/new/:id_comment' 	=> 'comms#new'
match'/comms/create'			=>'comms#create', :as => :comentario_comm
match'/user/passedit/:id'		=>'users#passedit', :as=> :passedit
match'/comment/desactivar/:id' =>'comments#desactivar', :as => :desactivar_comment
match'/comment/activar/:id' =>'comments#activar', :as => :activar_comment
match'/post/desactivar/:id' =>'posts#desactivar', :as => :desactivar_post
match'/post/activar/:id' =>'posts#activar', :as => :activar_post


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
   root :to => 'static#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
