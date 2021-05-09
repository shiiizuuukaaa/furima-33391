class OderAdress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number
  end

  validates :prefecture_id, numericality: {other_than: 1, message: 'Select'}
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
  validates :phone_number, numericality: {message: 'Input only number'}

  def save
    Oder.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, oder_id: oder.id)
  end
end