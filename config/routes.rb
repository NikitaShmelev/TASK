Rails.application.routes.draw do
 
  
  resources :companies do
    resources :comments
  end
  

  devise_for :users, only: :omniauth_callbacks, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    companies: 'companies#index'
  }

  scope '/(:locale)', locale: /#{I18n.available_locales.join("|")}/ do

    devise_for :users, skip: :omniauth_callbacks
    root 'home#index'
    get 'persons/profile', as: 'user_root'
    get 'users/edit', as: 'users_edit_path'
    
  end
  
   
 
end