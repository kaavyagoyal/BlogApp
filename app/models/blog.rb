class Blog < ApplicationRecord

  acts_as_votable
  belongs_to :user
  has_many :comments

  mount_uploader :image, ImageUploader
end
