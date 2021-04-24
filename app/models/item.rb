class Item < ApplicationRecord
  belongs_to :user
  has_one :oder
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range'}
  validates :price, numericality: { message: 'Half-width number'}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options numericality: { other_than: 1, message: 'Select'} do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

end
