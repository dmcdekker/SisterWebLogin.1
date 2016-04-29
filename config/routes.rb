Rails.application.routes.draw do




  resources :users do
    resources :userblogs
  end
  
  resources :userblogs do
    resources :comments
  end

 #adding sign up/log in routes
  resources :users
  
  # routes to sign up and log in
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'login' => 'sessions#new', :as => 'loginuser'
  post 'login' => 'sessions#find', :as=> 'finduser'
  
  #for 3rd party authentication, creates a new session for this user, attached to login
  get  'auth/:provider/callback' => 'sessions#create',:as => 'login'
  # gives the option to log out
  get 'logout' => 'sessions#destroy'
  # post 'logout' => 'sessions#destroy' -- this was initially in the pastebin
  # if the authentication doesn't go through
  get  'auth/failure' => 'sessions#failure'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'staticpages/home'

  get 'staticpages/profiles'
  
  get 'staticpages/about'

  get 'staticpages/calendar'
  

  get 'calendar/show'
  
  resource :calendar, only: [:show], controller: :calendar
  
  resources :events

  get 'events/show'
  
  
  
  root :to => redirect('/staticpages/home')
  
end
