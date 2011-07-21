class Client < ActiveRecord::Base

  validates :name, :presence => true
  validates :siret, :presence => true
  validates :statut, :presence => true

end