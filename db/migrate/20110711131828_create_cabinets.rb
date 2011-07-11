class CreateCabinets < ActiveRecord::Migration
  def change
    create_table :cabinets do |t|
      t.string :name
      t.string :statut
      t.date :creation_date
      t.string :siret
      t.string :description
      t.integer :rating
      t.string :linkedin
      t.string :facebook
      t.string :twitter
      t.string :cabinet_url
      t.timestamps
    end
  end
end
