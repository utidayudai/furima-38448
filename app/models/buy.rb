class Buy < ApplicationRecord
  belongs_to :buy_record

  validates :city, presence: { message: "can't be blank" }
  validates :address_number, presence: { message: "can't be blank" }
  validates :address, presence: { message: "can't be blank" }
  validates :phone_number, presence: { message: "can't be blank" }
  validates :place_id, numericality: {other_than: 0, message: "can't be blank"}
end


