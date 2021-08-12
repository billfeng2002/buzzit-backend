Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/rooms/:id", to: "rooms#view"
  post "/rooms", to: "rooms#create"
  patch "/rooms/:id", to: "rooms#update"
  post "/responses", to: "responses#create"
  post "/questions", to: "questions#create"
  patch "/users/:id", to: "users#update"
  post "/users", to: "users#create"
  delete "/users/:id", to: "users#destroy"
  delete "/rooms/:id", to: "rooms#destroy"
  post  "/check_room_exists", to: "rooms#check_exists"
  get "/messages/:room_id", to: "messages#get_messages"
  post "/messages", to: "messages#create"
  get "/questions/:id", to: "questions#show"
  get "/user_room_info/:room_id", to: "rooms#user_info"
  get "/owner_room_info/:room_id", to: "rooms#owner_info"
  get "/member_list/:room_id", to: "rooms#get_member_info"
end
