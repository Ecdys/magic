class Implantation < ActiveRecord::Base
  
  attr_accessor :address
  belongs_to :cabinet
  
end
 