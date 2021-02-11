FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    price { 10000 }
    text { Faker::Lorem.sentence }
    category_id { 2 }
    state_id { 2 }
    cost_id { 2 }
    prefecture_id { 2 }
    day_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end