Rails.application.routes.draw do
  resources :registrations

  post "/hook" => "registrations#hook"
  post "/registrations/:id" => "registrations#show"

  resources :courses
  get '/home' => 'home#index'

  root "courses#index"
end
