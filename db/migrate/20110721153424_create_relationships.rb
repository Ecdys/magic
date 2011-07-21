class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :proposal
      t.references :cabinet
      t.string :status
      t.timestamps
    end
  end
end
