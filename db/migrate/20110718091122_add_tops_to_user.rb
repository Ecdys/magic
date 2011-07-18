class AddTopsToUser < ActiveRecord::Migration
  def up
    add_column :users, :cabinet_id, :integer
    add_column :users, :client_id, :integer
  end
  def down
     remove_column :users, :cabinet_id
     remove_column :users, :client_id
   end
end
