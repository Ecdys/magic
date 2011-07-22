class Cabinet < ActiveRecord::Base
  
  validates_presence_of :name, :statut, :siret, :description
  validates_uniqueness_of :siret
  has_many :contacts, :dependent => :destroy
  has_many :implantations, :dependent => :destroy
  has_many :testimonials, :dependent => :destroy
  # has_many :testimonials, :dependent => :destroy
  
  has_many :relationships
  
  has_attached_file :logo, :styles => {
    :small => "300x300>"
  }
  
  acts_as_taggable_on :tags
  
  define_index do
    
    indexes name
    indexes description
    indexes contacts(:nom)
    indexes contacts(:prenom)
    indexes tags(:name)
    indexes implantations(:administrative_area_level_1)
    indexes implantations(:administrative_area_level_2)
    indexes implantations(:administrative_area_level_3)
    indexes implantations(:locality)
    indexes implantations(:country)
    indexes implantations(:postal_code)
    
    has tags(:id), :facet => true, :as => :tags
    
    has "RADIANS(implantations.latitude)", :as => :latitude, :type => :float
    has "RADIANS(implantations.longitude)", :as => :longitude, :type => :float
    
    has id, :as => :cabinet_id
    
  end
  
end
