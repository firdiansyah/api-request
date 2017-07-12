Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
        put "items/restore", to: "items#restore"
        get "items/findByName/:name", to: "items#getByName"

        resources :items
    end
  end
end
