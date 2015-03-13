require 'sinatra'
require "sinatra/reloader" if development?
require 'active_record'

set :public, File.dirname(__FILE__) + '/public'

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
	images_name = Dir.glob("public/images/*")
	@images_path = []
	
	images_name.each do |image|
		@images_path << image.gsub("public/", "./")
	end
	@users = User.order("created_at DESC").limit(6)
	erb :index
end






# お店のフォーム投稿画面

get '/store' do

	
erb :store

end



post '/form' do

	
	save_path = "./public/images/#{params[:file][:filename]}"
 
		File.open(save_path, 'wb') do |f|
			p params[:file][:tempfile]
			f.write params[:file][:tempfile].read

	 end


	
	User.create(:name => params[:name],
				:location => params[:location],
				:station => params[:station],
				:map_url => params[:map_url],
				:menu => params[:menu],
				:comment => params[:comment],
				:open => params[:open],
				:images => "/images/#{params[:file][:filename]}"
				)

	p User.all
	redirect '/store'

end



#場所で検索 

post '/search' do

	@place = params[:location]
	redirect '/result'
end


get '/result' do

	@result =p User.find_by_location("@place")
	
　　erb :result
	end







