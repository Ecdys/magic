class Cabinet < ActiveRecord::Base
  
  validates_presence_of :name, :statut, :siret, :description
  validates_uniqueness_of :siret
  has_many :contacts, :dependent => :destroy
  has_many :implantations, :dependent => :destroy
  has_many :testimonials, :dependent => :destroy
  # has_many :testimonials, :dependent => :destroy
  
  has_many :relationships
  
  has_attached_file :logo
  
  acts_as_taggable_on :tags
  
  define_index do
    
    indexes name
    indexes description
    indexes contacts(:nom)
    indexes contacts(:prenom)
    indexes tags(:name)
    
    has tags(:id), :facet => true, :as => :tags
    
  end
  
end
