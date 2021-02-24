class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_area_id, :city, :street_address, :building, :phone, :order_id, :item_id, :user_id

  with_options presence: true do 
    validates :user_id
    validates :item_id
    validates :order_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :street_address
    validates :building
    validates :phone, format: {with: /\A\d{11}\z/}
  end

    validates :shipment_area_id, numericality: { other_than: 1 }


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, shipment_area_id: shipment_area_id, city: city, street_address: street_address, building: building, phone: phone, order_id: order_id)
  end
end