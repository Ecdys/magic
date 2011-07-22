class ReworkImplantations < ActiveRecord::Migration
  def up
    add_column :implantations, :street_address, :string
    add_column :implantations, :country, :string
    add_column :implantations, :administrative_area_level_1, :string
    add_column :implantations, :administrative_area_level_2, :string
    add_column :implantations, :administrative_area_level_3, :string
    add_column :implantations, :locality, :string
    add_column :implantations, :postal_code, :string
    remove_column :implantations, :address
  end

  def down
    remove_column :implantations, :street_address
    remove_column :implantations, :country
    remove_column :implantations, :administrative_area_level_1
    remove_column :implantations, :administrative_area_level_2
    remove_column :implantations, :administrative_area_level_3
    remove_column :implantations, :locality
    remove_column :implantations, :postal_code
    add_column :implantations, :address, :string
  end
end
