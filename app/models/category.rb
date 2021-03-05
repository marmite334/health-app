class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '免疫' },
    { id: 3, name: '栄養' },
    { id: 4, name: '食育' },
    { id: 5, name: '健康食品' },
    { id: 6, name: '医療' },
    { id: 7, name: '介護' },
    { id: 8, name: '福祉' },
    { id: 9, name: '衛生' },
    { id: 10, name: '分子生物学' },
    { id: 11, name: '病理学' },
    { id: 12, name: '感性科学' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :post
end
