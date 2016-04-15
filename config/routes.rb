Rails.application.routes.draw do


  resources :users do
    resources :comments
  end

controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
end
  
  
  get 'users/new'

  resources :users
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
