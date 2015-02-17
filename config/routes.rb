Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'time_logs#index'
  devise_for :users, controllers: {registrations: "registrations"}, path_names: {sign_in: "login", sign_out: "logout"}
  post "/teams/add_user" => "teams#ajax_add_user"
  get "/teams/remove_user" => "teams#ajax_remove_user"
  get "/time_logs/ajax_subcategories" => "time_logs#ajax_subcategories"
  resources :teams
  resources :categories
  resources :subcategories
  get "/time_logs" => 'time_logs#index'
  post "/time_logs/create" => 'time_logs#create'
  get "/users" => 'users#index'

  devise_scope :user do
    get "/users/logout" => "devise/sessions#destroy"
    get "/new_user" => "registrations#new_user"
    post "/add_user" => "registrations#add_user"
  end




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
