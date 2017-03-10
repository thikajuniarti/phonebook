FactoryGirl.define do

  factory :user do |u|
    u.email                  { Faker::Internet.email }
    u.password               '1234567890'
    u.password_confirmation  '1234567890'
  end

end
