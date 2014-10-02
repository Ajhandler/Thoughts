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

post '/sign-in' do 
	@user = User.where(username: params[:username]).first
	if @user && @user.password == params[:password]
		session[:user_id] = @user.id 
		redirect '/dashboard'
	else
		redirect 'signup'
	end
end

get '/dashboard' do 
	erb :dashboard
end

get '/signup' do
	erb :signup
end