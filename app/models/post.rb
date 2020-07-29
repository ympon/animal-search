class Post < ApplicationRecord
  belongs_to :user

  validates :image, presence: true, unless :text?
  validates :text, presence: true
end
