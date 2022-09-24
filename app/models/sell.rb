class Sell < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :derivery_price
  belongs_to :place
  belongs_to :delively


  validates :title, presence: true
  validates :title_content, presence: true
  validates :price, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :derivery_price_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :place_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delively_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
end
