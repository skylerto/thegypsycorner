class Artists::Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :pieces

  has_attached_file :image, :styles => { :full => "1200x1200#", :medium => "300x300#", :thumb => "100x100#" }#, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
