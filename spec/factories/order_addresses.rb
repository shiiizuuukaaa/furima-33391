FactoryBot.define do
  factory :order_address do
    token          { 'tok_aaaaaaaaaa' }
    postal_code    { '111-1111' }
    prefecture_id  { 2 }
    city           { '板橋区' }
    addresses      { '１−１−１' }
    building       { 'テストビル' }
    phone_number   { 00000000000 }
    user_id        { 1 }
    item_id        { 1 } 
  end
end
