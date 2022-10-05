FactoryBot.define do
  factory :buy_buy_record do
    place_id              { 2 }
    city                  { Faker::Lorem.sentence }
    address_number        { '123-4567' }
    address               { Faker::Lorem.sentence }
    building              { Faker::Lorem.sentence }
    phone_number          { '08012345678'}
    token                 {"tok_abcdefghijk00000000000000000"}
  end
end
