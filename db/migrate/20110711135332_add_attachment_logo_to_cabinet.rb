class AddAttachmentLogoToCabinet < ActiveRecord::Migration
  def self.up
    add_column :cabinets, :logo_file_name, :string
    add_column :cabinets, :logo_content_type, :string
    add_column :cabinets, :logo_file_size, :integer
    add_column :cabinets, :logo_updated_at, :datetime
  end

  def self.down
    remove_column :cabinets, :logo_file_name
    remove_column :cabinets, :logo_content_type
    remove_column :cabinets, :logo_file_size
    remove_column :cabinets, :logo_updated_at
  end
end
