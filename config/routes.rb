Rails.application.routes.draw do
  get "/rooms" => "rooms#index"

  get "/rooms/:id" => "rooms#show"
end
