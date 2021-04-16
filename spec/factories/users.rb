FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'aaa111' }
    password_confirmation { password }
    first_name            { '苗字' }
    last_name             { '名前' }
    first_name_kana       { 'ミョウジ' }
    last_name_kana        { 'ナマエ' }
    birth_date            { 20_000_101 }
  end
end
