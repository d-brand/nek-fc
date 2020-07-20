Rails.application.routes.draw do
  resources :answers
  resources :schedules
  root 'schedules#show'
  # get "/" => "schedules#index"
  get "schedules/kiyaku" => "schedules#kiyaku"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
