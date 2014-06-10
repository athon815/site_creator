class AddAttachmentImageToSections < ActiveRecord::Migration
  def self.up
    change_table :sections do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :sections, :image
  end
end
