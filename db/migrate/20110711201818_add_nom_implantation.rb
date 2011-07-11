class AddNomImplantation < ActiveRecord::Migration
  def up
    add_column :implantations, :site, :string
  end

  def down
    remove_column :implantations, :site
  end
end
