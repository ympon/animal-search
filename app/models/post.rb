class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
  

  belongs_to :user,foreign_key: "user_id"

  validates :category_id, presence: true
  validates :text, presence: true, unless: :image?
  validates :image, presence: true,unless: :text?
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Post.where("text LIKE(?)", "#{search}")
    else
      Post.all
    end
  end
  def self.category(category_id)
    if search
      Post.where(category_id: category_id)
    else
      Post.all
    end
    end
end