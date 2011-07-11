class Implantation < ActiveRecord::Base
  attr_accessible :site, :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode,  :if => :address_changed?
  belongs_to :cabinet
end
 