WincorNixdorf::Application.routes.draw do


  resources :pickups do
  
  resources :deliveries do
  resources :delivery_units
  end
  end


  resources :admins

  get 'admin/:admin_id/products' => 'products#index'

  get 'get_token/:name/:password' => 'admins#get_token'
  get 'WebModSignOn/:name/:password' => 'admins#get_token'
  
  get "webmodesessions/new"
  
  get 'get_product/:id' => 'products#get_product'
  get 'WebModBarcodeTemplate/:id' => 'products#get_product'
  
  resources :web_mode_sign_ons
  
  get 'payment_history/:admin_id' => 'products#get_all_products', :as => :payment_path
  get 'WebModTotal' => 'products#WebModTotal'
  
  get 'WebModPayment/:user_id' => 'products#WebModPayment'
  
  get 'api' => 'pickups#api'
  get "api/v1/pickup/:code/get_deliveries" => "pickups#get_deliveries"

  devise_for :users

  resources :products

  root :to => "pickups#index"
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
