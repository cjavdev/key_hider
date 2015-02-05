Rails.application.routes.draw do
  root to: "static_pages#root"
  get '/welcome' => 'static_pages#welcome', as: :welcome
  get '/auth/:provider/callback' => 'sessions#create'
  resource :session, only: [:destroy]

  namespace :api, defaults: { format: :json } do

  end
end
