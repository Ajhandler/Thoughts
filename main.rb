require 'bundler/setup'
require 'sinatra'
require 'sinatra/activerecord'
require './models'


configure(:development){set :
database, "sqlite:///thoughts.sqlite3"}

enable :sessions
set :sessions => true

#Define Current user
def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
	end
end

def users_id
	User.all.each do |i|
		@qi = i[:id]
		puts @qi
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


post '/sign-up' do
	@user = User.new(params[:user])
	@user.save
	session[:user_id] = @user.id 
	redirect '/dashboard'
end


post '/speak' do
	@post = Post.new(params[:think])
	@post.user_id = current_user.id
	@post.save
	"You Made It"
end
get '/dashboard' do 
	@posts = current_user.posts
	@all_users = User.all
	erb :dashboard
end
get '/signup' do
	erb :signup
end
get '/logout' do
	session[:user_id] = nil
    'logged out'
end

get '/profile' do
	@user_clicked = User.id
end




