class Section < ActiveRecord::Base
	belongs_to :page
	has_attached_file :image, :styles => { :medium => "350x150>", :thumb => "100x100>" }, :defualt_url => "http://placehold.it/350x150"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
