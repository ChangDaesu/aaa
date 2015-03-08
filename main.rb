require 'sinatra'

get '/' do 
	erb :index
end

post '/' do 
	@name = params[:name]
	erb :index
end

get '/area' do 
	erb :index
end

get '/menu' do 
	erb :index
end

get '/login' do 
	erb :index
end

post '/form' do 
	erb :index
end

post '/toko' do 
	erb :index
end

get '/syosai' do 
	erb :index
end

