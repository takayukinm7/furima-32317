class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :familyname, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :firstname, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :familynamekana, format: { with: /\A[ァ-ヶ]+\z/ }
    validates :firstnamekana, format: { with: /\A[ァ-ヶ]+\z/ }
    validates :date
  end

  has_many :items
  has_many :comments
  has_many :buyers

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
end
