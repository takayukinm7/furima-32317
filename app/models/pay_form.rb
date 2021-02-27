class PayForm
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :numbering, :building, :phone

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :numbering
    validates :phone, length: { maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Sendinfo.create(buyer_id: buyer.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                    numbering: numbering, building: building, phone: phone)
  end
end
