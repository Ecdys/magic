class AddParcoursToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :parcours, :text
  end
end
