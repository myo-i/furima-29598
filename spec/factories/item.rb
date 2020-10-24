FactoryBot.define do
  factory :item do
    user_id             { '2' }
    name                { 'aaa' }
    description         { 'aaaaaaあああ沖縄県3' }
    category_id         { '2' }
    product_state_id    { '2' }
    payment_burden_id   { '2' }
    area_id             { '2' }
    delivery_days_id    { '2' }
    price               { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
