Rails.application.routes.draw do
  devise_for :users
  get 'pages/info'
  #post ':event_id/possibilities(.:format)/:number' => 'possibilities#create', as: 'maker'

  get ':event_id/possibilities(.:format)/' => 'date_events#new', as: 'eventicer'

  get 'kalender', to: 'kalender#kalender', as: 'kalender'

  post '/confirm/:possibility_id' => 'possibilities#confirm', as: 'confirm'

  get "/kalender/search" => 'kalender#kalender'
  get "/event/search" => 'kalender#show'

  resources :meetings
  resources :events do
    resources :possibilities
  end

  get 'myevents' => 'events#myevents', as: 'myevents'

  resources :possibilities do
    resources :date_events
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'kalender#kalender'

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
