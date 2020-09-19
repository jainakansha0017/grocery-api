class OrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity

  def link
    [
      {
        rel: :self,
        href: "#{Settings.base_url}/api/v1/orders/#{object.id}"
      },
      {
        rel: :product,
        href: "#{Settings.base_url}/api/v1/products/#{object.product_id}"
      },
      {
        rel: :cart,
        href: "#{Settings.base_url}/api/v1/carts/#{object.cart_id}"
      }
    ]
  end
end
