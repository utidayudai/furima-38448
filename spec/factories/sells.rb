FactoryBot.define do
  factory :sell do
    title                 { Faker::Lorem.sentence }
    title_content         { Faker::Lorem.sentence }
    price                 { Faker::Lorem.sentence }
    category_id           { Category.all.sample }
    condition_id          { 1 }
    derivery_price_id     { 1 }
    place_id              { 1 }
    delively_id           { 1 }
    after(:build) do |sell|
      sell.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
