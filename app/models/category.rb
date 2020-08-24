class Category < ActiveHash::Base

  self.data = [
    {id: 1, name: '虫'}, {id: 2, name: '魚介類'}, {id:3, name: '鳥類'}, {id: 4, name: '両生類'}, {id: 5, name: 'は虫類'}, {id: 6, name: 'ほ乳類'}
  ]

  include ActiveHash::Associations
  has_many :posts
  
end
