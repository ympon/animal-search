class Category < ApplicationRecord
  has_ancestry
  has_many :posts_categories, dependent: :destroy
  has_many :posts, through: :posts_categories
end
