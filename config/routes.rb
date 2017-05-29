Rails.application.routes.draw do
  root "pages#index"

  resource :screencast
end
