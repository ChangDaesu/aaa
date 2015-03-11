class CreateTables < ActiveRecord::Migration
  def change
  	create_table :tables do |t|
  		t.integer :user_id
  		t.integer :people
  		t.boolean :empty
  	end
  end
end
