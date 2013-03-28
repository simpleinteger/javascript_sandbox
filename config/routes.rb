JavascriptSandbox::Application.routes.draw do
  root :to => "home#index"
  authenticated :user do
    root :to => 'home#index'
  end
  devise_for :users
  resources :users, :only => [:show, :index]
  constraints(Subdomain) do
    match '/' => 'profiles#show'
  end
end
