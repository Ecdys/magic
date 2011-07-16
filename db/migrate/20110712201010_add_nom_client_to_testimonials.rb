class AddNomClientToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :client_prenom, :string
    add_column :testimonials, :client_nom, :string
  end
end
