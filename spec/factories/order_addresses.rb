FactoryBot.define do
  factory :order_address do
    token          { 'tok_aaaaaaaaaa' }
    postal_code    { '111-1111' }
    prefecture_id  { 2 }
    city           { '板橋区' }
    addresses      { '１−１−１' }
    building       { 'テストビル' }
    phone_number   { 0o0000000000 }
  end
end
