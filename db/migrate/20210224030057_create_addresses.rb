class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string            :postal_code,       null: false
      t.integer           :shipment_area_id,  null: false
      t.string            :city,              null: false
      t.string            :street_address,    null: false
      t.string            :building
      t.string            :phone,              null: false
      t.references        :order,             foreign_key: true
      t.timestamps        
    end
  end
end
