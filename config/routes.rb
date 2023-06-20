Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :drivers, only: [:create]
      resources :trucks
      post "sign_in", to: "drivers#sign_in"
      put "assign_truck", to: "drivers#assign_truck"

    end
  end
end