class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
     validates :familyname 
     validates :firstname
    end
    with_options format: { with: /\A[ァ-ヶ]+\z/ } do
      validates :familynamekana
      validates :firstnamekana
    end
    validates :date
  end

  has_many :items
  has_many :comments
  has_many :buyers

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
end
