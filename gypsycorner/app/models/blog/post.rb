class Blog::Post < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  validates :title, presence: true

  has_attached_file :image, :styles => { :full => "1200x1200#", :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/images/missing-post.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
