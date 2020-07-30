class Post < ApplicationRecord
  # belongs_to :user
  has_many :posts_categories, dependent: :destroy
  has_many :categories, through: :posts_categories

  # validates :text, presence: true, unless :image?

  mount_uploader :image, ImageUploader
end