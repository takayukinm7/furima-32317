FactoryBot.define do
  factory :pay_form do

    postal_code { '123-1234' }
    prefecture_id { 2 }
    city { '豊島区' }
    numbering { '1-1' }
    building { '1111' }
    phone { 19012231233 }
    user_id { 1 }
    item_id { 1 }
  end
end
