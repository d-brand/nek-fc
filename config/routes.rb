Rails.application.routes.draw do
  root 'schedules#show'
  # get "/" => "schedules#index"
  get "schedules/kiyaku" => "schedules#kiyaku"
  resources :answers
  resources :schedules
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
