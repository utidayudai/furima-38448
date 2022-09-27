FactoryBot.define do
  factory :sell do
    title                 { Faker::Lorem.sentence }
    title_content         { Faker::Lorem.sentence }
    price                 { 1000 }
    category_id           { 2 }
    condition_id          { 2 }
    derivery_price_id     { 2 }
    place_id              { 2 }
    delively_id           { 2 }
    after(:build) do |sell|
      sell.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
