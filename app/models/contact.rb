class Contact < ActiveRecord::Base
  
   validates_presence_of :nom, :prenom, :fonction
   has_attached_file :photo
   belongs_to :cabinet
   
end
