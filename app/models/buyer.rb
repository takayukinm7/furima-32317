class Buyer < ApplicationRecord
  has_one :send
  belongs_to :item
end
