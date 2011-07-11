class Cabinet < ActiveRecord::Base
  
  validates_presence_of :name, :statut, :siret, :description
  validates_uniqueness_of :siret
  has_many :contacts
  
  has_attached_file :logo
   
end
