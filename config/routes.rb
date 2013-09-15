Dans::Application.routes.draw do
  get "pages/about"

  devise_for :users

  resources :blogs
  get 'blogs/:id/:slug' => 'blogs#show', as: 'blog_with_slug'
  post 'blogs/preview' => 'blogs#preview'

  root :to => 'blogs#index'
end
