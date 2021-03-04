FactoryBot.define do
  factory :pay_form do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-1234' }
    prefecture_id { 2 }
    city { '豊島区' }
    numbering { '1-1' }
    building { '1111' }
    phone { 19_012_231_233 }
  end
end
