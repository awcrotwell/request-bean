Rails.application.routes.draw do
  resources :requests, except: [:index, :new]
  resources :bins

  post '/bins/:bin_url' => 'bins#new_request'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
