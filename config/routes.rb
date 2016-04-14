Rails.application.routes.draw do

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

  get 'users/show'
  
  
  
  resources :users do
    resources :comments
  end
  
  root :to => redirect('/staticpages/home')
  
end
