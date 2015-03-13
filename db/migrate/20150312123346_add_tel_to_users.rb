class AddTelToUsers < ActiveRecord::Migration
  def change

    # [形式] add_column(テーブル名, カラム名, データ型)
    add_column :users, :tel, :string
  end
end
  