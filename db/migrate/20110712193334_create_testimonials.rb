class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.integer :cabinet_id
      t.string :client_name
      t.text :citation

      t.timestamps
    end
  end
end
