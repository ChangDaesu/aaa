class ChangeDatatypeOpenOfUsers < ActiveRecord::Migration
  def change
  	# db/migrate/20140808183810_change_datatype_title_of_articles.rb
    # [形式] change_column(テーブル名, カラム名, データタイプ, オプション)
    change_column :users, :open, :integer

    # オプション
    # limit - カラム長の最大数
    # change_column :articles, :title, :text, limit: 120

    # default - カラムのデフォルト値を設定。NULLにしたい場合は、nilを指定
    # change_column :articles, :title, :text, default: "タイトルがありません"

    # null - null制約を設定。false -> null制約がON。true -> null制約がOFF
    # change_column :articles, :title, :text, null: true
  
  end
end
