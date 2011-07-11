class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :nom
      t.string :prenom
      t.string :phone
      t.string :mobile_phone
      t.string :fonction
      t.string :email
      t.string :linkedin
      t.string :facebook
      t.string :twitter
      t.string :viadeo
      t.integer :cabinet_id
      
      t.string :email

      t.timestamps
    end
  end
end
