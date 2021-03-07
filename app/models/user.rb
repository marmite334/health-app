class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }
    validates :birth_date
  end
  has_many :post
  has_many :comments

  def self.guest
    find_or_create_by(email: Faker::Internet.email ) do |user|
      user.nickname = 'ゲストユーザー'
      user.password = Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1)
      user.birth_date = Faker::Date.birthday(min_age: 5, max_age: 90)
    end
  end
  
end
