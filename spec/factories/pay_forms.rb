FactoryBot.define do
  factory :pay_form do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-1234' }
    prefecture_id { 2 }
    building { 'aaa' }
    city { '豊島区' }
    numbering { '1-1' }
    phone { '09000000000' }
  end
end
