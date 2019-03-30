class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_votable
  has_many :reviews, dependent: :destroy
  has_many :favorites
  has_many :fans, :through => :favorites, :source => :user 
end
