Rails.application.routes.draw do


  namespace :api do

    namespace :v1 do
      resources :realms
      resources :accounts
    end

  end

end
