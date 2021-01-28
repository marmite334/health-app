class Post < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :content
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
  end
  belongs_to :user
  has_one_attached :image
end
