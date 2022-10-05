class BuyRecord < ApplicationRecord
  belongs_to :user
  has_one :buy
  belongs_to :sell
end
