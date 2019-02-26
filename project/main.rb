require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative 'db_config'
require_relative 'models/bookmark'
require_relative 'models/user'
enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
  def logged_in?
    if current_user 
      true
    else
      false
    end
  end
end


get '/' do
  erb :index
end

get '/sign_up' do
    erb :signup
end

post '/session' do
  user = User.find_by(email: params["email"])
  if user && user.authenticate(params["password"])
    session[:user_id] = user.id
    redirect '/'
  else
    erb :login
  end
end

get '/log_in' do
  erb :login
end

post '/sign_up' do
  user = User.new
  user.firstname = params[:firstname]
  user.lastname = params[:lastname]
  user.birthdate = params[:birthdate]
  user.email = params[:email]
  user.password = params[:password]
  user.save

  redirect '/'
end