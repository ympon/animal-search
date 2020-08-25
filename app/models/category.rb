class Category < ActiveHash::Base

  self.data = [
    {id: 0, name: '虫'}, {id: 1, name: '魚介類'}, {id:2, name: '鳥類'}, {id: 3, name: '両生類'}, {id: 4, name: 'は虫類'}, {id: 5, name: 'ほ乳類'}
  ]

  include ActiveHash::Associations
  has_many :posts
  
end
