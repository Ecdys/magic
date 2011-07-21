class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :statut
      t.string :siret
      t.text :description
      t.string :linkedin
      t.string :facebook
      t.string :twitter
      t.string :url
      t.timestamps
    end
  end
end
