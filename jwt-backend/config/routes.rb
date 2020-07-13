Rails.application.routes.draw do

  post "/api/user/login", to: "users#login"
  post "/api/user/create", to: "users#create"
  
  # Tasks
  get "/api/tasks/getall", to: "tasks#index"
  get "/api/tasks/getone", to: "tasks#show"
  post "/api/tasks/create", to: "tasks#create"
  put "/api/tasks/update", to: "tasks#update"
  delete "/api/tasks/remove", to: "tasks#remove"

  # Send PDF
  get "/api/tasks/pdf", to: "tasks#mipdf"

  get "/auto_login", to: "users#auto_login"
end
