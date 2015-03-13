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









# お客さんの投稿閲覧 & 検索画面

get '/' do 
	
	@users = User.order("created_at　desc").limit(5)
	erb :index
end







# お店のフォーム投稿画面

get '/store' do

	
erb :store

end



post '/form' do
	
	User.create(:name => params[:name],
				:location => params[:location],
				:station => params[:station],
				:map_url => params[:map_url],
				:menu => params[:menu],
				:comment => params[:comment],
				:open => params[:open])

	p User.all
	redirect '/store'

end








