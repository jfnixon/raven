Raven::Application.routes.draw do
  match "home" => "static_pages#home"
  match "help" => "static_pages#help"
  match "about" => "static_pages#about"

  devise_for :users

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'static_pages#home'
end
