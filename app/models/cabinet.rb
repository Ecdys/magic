class Cabinet < ActiveRecord::Base
  
  validates_presence_of :name, :statut, :siret, :description
  validates_uniqueness_of :siret
  has_many :contacts, :dependent => :destroy
  has_many :implantations, :dependent => :destroy
  has_many :testimonials, :dependent => :destroy
  # has_many :testimonials, :dependent => :destroy
  has_attached_file :logo
   
end
