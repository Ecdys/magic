class ChangeDescriptionInCabinet < ActiveRecord::Migration
  def up
    change_column :cabinets, :description, :text
  end

  def down
    change_column :cabinets, :description, :string
  end
end
