class BuyBuyRecord
  include ActiveModel::Model
  attr_accessor :place_id, :city, :address, :address_number, :building, :phone_number, :user_id, :sell_id

  validates :place_id, numericality: {other_than: 0, message: "can't be blank"}
  validate  :user_id
  validate  :sell_id
  with_options presence: { message: "can't be blank" } do
    validates :city
    validates :address_number
    validates :address
    validates :phone_number
  end

  def save
    buy_record = BuyRecord.create(user_id: user_id, sell_id: sell_id)  
    Buy.create(place_id: place_id, city: city, address_number: address_number, address: address, building: building, phone_number: phone_number, buy_record_id: buy_record.id)
  end
end
