class Photo < ApplicationRecord
  has_attached_file :image, styles: { medium: "600x", thumb: "240x" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :user
end
