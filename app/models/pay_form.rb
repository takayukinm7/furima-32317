class PayForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :numbering, :building, :phone
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :numbering
    validates :phone, length: { maximum: 11 }
    validates :user_id
    validates :item_id
  end

  def save
    Buyer.create(user_id: user_id, item_id: item_id)
    Send.create(buyer_id: buyer_id, poastal_code: postal_code, prefecture: prefecture, city: city, numbering: numbering, building: building, phone: phone).merge(user_id: user.id, item_id: item.id)
  end

end