Ticketea::Application.routes.draw do
  # first created -> highest priority.

  devise_for :users, :controllers => { :registrations => "registrations" }
  get '/awaiting_confirmation',
      :to => "users#confirmation",
      :as => 'confirm_user'

  resources :projects do
    resources :tickets
  end

  root :to => "projects#index"
  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
  end

  put '/admin/users/:user_id/permissions',
                    :to => 'admin/permissions#update',
                    :as => :update_user_permissions

end
