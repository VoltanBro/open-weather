Rails.application.routes.draw do
  resource :home, only: :show, controller: 'home'
end
