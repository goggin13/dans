Dans::Application.routes.draw do
  get "pages/about"

  devise_for :users

  resources :blogs
  post 'blogs/preview' => 'blogs#preview'

  root :to => 'blogs#index'
end
