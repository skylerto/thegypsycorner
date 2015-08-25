class Artists::Piece < ActiveRecord::Base
  belongs_to :user
  belongs_to :portfolio

  validates :title, presence: true

  has_attached_file :image, :styles => { :full => "1200x1200#", :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/images/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
