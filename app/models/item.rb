class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :title
    validates :text
    validates :image
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price, numericality: { less_than_or_equal_to: 9999999}
    validates :price, numericality: { greater_than_or_equal_to: 300}
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
  #has_one :buyer
  has_one_attached :image

  belongs_to :category
  belongs_to :state
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :day
end