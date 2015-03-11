require 'sinatra'
require "sinatra/reloader" if development?
require 'active_record'

ActiveRecord::Base.establish_connection(
	"adapter" => "sqlite3",
	"database" => "./aaa.sqlite3"
)

class User < ActiveRecord::Base
	has_many :tables, dependent: :destroy
end

class Table < ActiveRecord::Base
	belongs_to :user
end

get '/' do 
	@users = User.order("id desc").all
	erb :index
end


post '/new' do
	 @users = User.create({:name => params[:name]})
	redirect '/'
end


