Rails.application.routes.draw do

  post "/api/user/login", to: "users#login"
  post "/api/user/create", to: "users#create"

  
  get "/auto_login", to: "users#auto_login"
end
