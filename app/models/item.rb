class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :title
    validates :text
    validates :image
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates_inclusion_of :price, in: 300..9_999_999
    validates :user
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :cost_id
      validates :prefecture_id
      validates :day_id
    end
  end

  belongs_to :user
  has_many :comments
  has_one :buyer
  has_one_attached :image

  belongs_to :category
  belongs_to :state
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :day
end
