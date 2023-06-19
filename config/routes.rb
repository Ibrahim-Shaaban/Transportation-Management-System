Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'accounts' , to: "accounts#index"
      post 'accounts', to: "accounts#get_data"
    end
  end
end