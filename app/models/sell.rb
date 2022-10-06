class Sell < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :derivery_price
  belongs_to :place
  belongs_to :delively

  validates :title, presence: true
  validates :title_content, presence: true, length: { minimum: 1, maximum: 1000 }
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :derivery_price_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :place_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delively_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true

  belongs_to :user
  has_one :buy_records
  has_one_attached :image
end
