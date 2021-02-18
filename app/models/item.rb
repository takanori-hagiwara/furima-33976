class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
       belongs_to :category
       belongs_to :condition
       belongs_to :delivery_fee
       belongs_to :shipment_area
       belongs_to :shipment_date    
       has_one_attached :image

       with_options presence: true do
        validates :category
        validates :condition
       end

       with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :condition_id
        validates :delivery_fee_id
        validates :shipment_area_id
        validates :shipment_date_id
       end
 end