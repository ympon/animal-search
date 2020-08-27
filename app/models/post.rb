class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :area
  

  belongs_to :user,foreign_key: "user_id"
  has_many :comments  
  validates :area_id, presence: true
  validates :category_id, presence: true
  validates :text, presence: true, unless: :image?
  validates :image, presence: true,unless: :text?
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search != ""
      Post.where(['text LIKE(?)', "%#{search}%"])
    else
      Post.all
    end
  end
end