class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.string :station
  		t.string :map_url
  		t.time :open
  		t.time :close
  		t.text :comment

  		t.timestamps
  	end
  end
end
