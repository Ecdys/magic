class AddCabinetIdToImplantation < ActiveRecord::Migration
  def up
    add_column :implantations, :cabinet_id, :integer
  end

  def down
    remove_column :implantations, :cabinet_id
  end
end
