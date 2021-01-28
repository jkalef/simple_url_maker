Rails.application.routes.draw do

  root 'user_urls#new'

  resources :user_urls, only: [:index, :show, :create, :new] do
    resources :url_statistics, only: [:index]
  end

end
