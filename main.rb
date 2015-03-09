require 'sinatra'

require 'active_record'

ActiveRecord::Base.establish_connection(
	"adapter" => "sqlite3",
	"database" => "./aaa.db"
	)


	class Comment < ActiveRecord::Base
	end

get '/' do 
	@comments = Comment.order("id desc").all
	erb :index
end

post '/' do 

	erb :index
end

get '/area' do 
	erb :area
end

get '/menu' do 
	erb :menu
end

get '/login' do 
	erb :login
end


post '/form' do 
	erb :form
end

post '/toko' do 
	erb :toko
end

get '/syosai' do 
	erb :syosai
end

