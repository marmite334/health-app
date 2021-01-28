class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '（仮）1' },
    { id: 3, name: '（仮）2' },
    { id: 4, name: '（仮）3' },
    { id: 5, name: '（仮）4' },
    { id: 6, name: '（仮）5' },
    { id: 7, name: '（仮）6' },
    { id: 8, name: '（仮）7' },
    { id: 9, name: '（仮）8' },
    { id: 10, name: '（仮）9' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :post
end