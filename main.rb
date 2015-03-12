require 'sinatra'
require "sinatra/reloader" if development?
require 'active_record'

ActiveRecord::Base.establish_connection(
	"adapter" => "sqlite3",
	"database" => "./aaa.sqlite3"
)

class User < ActiveRecord::Base
	#has_many :tables, dependent:　:destroy
end

#class Table < ActiveRecord::Base
	#belongs_to :user
#end


# お客さんの投稿閲覧画面

get '/' do 
	@users = User.order("id desc").all
	erb :index
end


post '/new' do
	 @users = User.create({:name => params[:name]})
	redirect '/'
end








# お店のフォーム投稿画面

get '/store' do

	
erb :store

end



post '/form' do
	
	User.create({:name => params[:name]},
				{:location => params[:location]},
				{:station => params[:station]},
				{:map_url => params[:map_url]},
				{:menu => params[:menu]},
				{:comment => params[:comment]})

	p User.all
	redirect '/store'
	
end

















# お店の情報を検索する


get '/kensaku' do

	erb :kensaku
end






