require 'sinatra'
require 'sinatra/activerecord'
require './models'


set :database, "sqlite3:thoughts.sqlite3"

enable :sessions
set :sessions => true

def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
	end
end

get '/' do 
	erb :home
	
end

