class Image < ActiveRecord::Base
	belongs_to :section
	
	has_attached_file :file, :styles => { :medium => '350x150>', :thumb => '100x100>' }, :default_url => 'http://placehold.it/350x150'
	validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
end
