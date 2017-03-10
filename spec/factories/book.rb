FactoryGirl.define do

  factory :book, class: Book do
    name    'swastika'
    number  '081234321'
    address 'surabaya'
    email   'juni@gmail.com'
    user
  end
end
