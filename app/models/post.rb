class Post < ApplicationRecord
  belongs_to :user
  has_many :posts_categories, dependent: :destroy
  has_many :categories, through: :posts_categories

  validates :text, presence: true, unless: :image?
  validates :image, presence: true,unless: :text?
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Post.where("text LIKE(?)", "%#{search}%")
    else
      Post.all
    end
  end
end