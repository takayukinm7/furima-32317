class Buyer < ApplicationRecord
  has_one :sendinfo
  belongs_to :item
  belongs_to :user
end
