 # db/migrate/20140808182214_add_user_id_to_articles.rb 
class AddImageToUsers < ActiveRecord::Migration
  def change
    # [形式] add_column(テーブル名, カラム名, データ型)
    add_column :users, :images, :string
  end
end
