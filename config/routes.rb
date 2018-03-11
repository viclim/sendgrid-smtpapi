Rails.application.routes.draw do
  resources :emails do
    member do
      get :resend, to: 'emails#resend'
    end
  end

  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'emails#index'
end
