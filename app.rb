require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "pry-byebug"

get "/" do
  @restaurants = Restaurant.all

  erb :index
end

get "/restaurants/:id" do
  restaurant_id = params[:id]
  @restaurant = Restaurant.find(restaurant_id)

  erb :show
end

post "/restaurants" do
  restaurant_name = params[:name]
  restaurant_address = params[:address]
  binding.pry
  Restaurant.create!(name: restaurant_name, address: restaurant_address)

  redirect "/"
end
