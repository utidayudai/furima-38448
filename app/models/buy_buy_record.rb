class BuyBuyRecord
  include ActiveModel::Model
  attr_accessor :place_id, :city, :address, :address_number, :building, :phone_number, :user_id, :sell_id, :token

  validates :place_id, numericality: { other_than: 1, message: "can't be blank" }
  validates  :user_id, presence: true
  validates  :sell_id, presence: true
  validates :token, presence: true
  with_options presence: true do
    validates :city
    validates :address_number, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    buy_record = BuyRecord.create(user_id: user_id, sell_id: sell_id)
    Buy.create(place_id: place_id, city: city, address_number: address_number, address: address, building: building,
               phone_number: phone_number, buy_record_id: buy_record.id)
  end
end
