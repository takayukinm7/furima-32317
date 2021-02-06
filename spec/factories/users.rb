FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '111aaa' }
    password_confirmation { password }
    familyname { '山田' }
    firstname { '太郎' }
    familynamekana { 'ヤマダ' }
    firstnamekana { 'タロウ' }
    date { '2021/02/04' }
  end
end
