Drctly::Application.routes.draw do
  root "urls#index"
  resources :urls, only: [:show, :create, :new]

  get "/:code", to: "urls#direct"
end
