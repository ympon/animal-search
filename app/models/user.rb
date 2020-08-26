class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
