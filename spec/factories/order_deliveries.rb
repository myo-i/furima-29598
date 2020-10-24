FactoryBot.define do
  factory :order_delivery do
    postal_code   { '123-4567' }
    area_id       { '2' }
    city          { '横浜市緑区' }
    block         { '青山1-1-1' }
    building_name { '柳ビル103' }
    phone_number  { '09012345678' }
  end
end
