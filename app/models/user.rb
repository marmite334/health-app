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
    find_or_create_by(email: 'lenny@lowe.name' ) do |user|
      user.nickname = 'ゲストユーザー'
      user.password = 'm3f46c'
      user.birth_date = '2008-09-05'
    end
  end
  
end
