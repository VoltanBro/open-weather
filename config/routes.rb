Rails.application.routes.draw do
  resource :home, only: :show, controller: 'home'

  root to: "home#show"
end
