class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates_presence_of :product_id, :cart_id, :quantity
end
