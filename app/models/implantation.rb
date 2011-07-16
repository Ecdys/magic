class Implantation < ActiveRecord::Base
  attr_accessible :site, :address, :latitude, :longitude, :cabinet_id
  geocoded_by :address
  after_validation :geocode,  :if => :address_changed?
  belongs_to :cabinet
end
 