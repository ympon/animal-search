class Post < ApplicationRecord
  # belongs_to :user
  has_many :posts_categories, dependent: :destroy
  has_many :categories, through: :posts_categories

  validates :image, presence: true, unless :text?
  validates :text, presence: true

  mount_uploader :image, ImageUploader
end