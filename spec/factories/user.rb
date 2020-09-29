FactoryBot.define do
  factory :user do
    nickname                { 'aaa' }
    email                   { 'aaa@gmail.com' }
    password                { 'abc123' }
    password_confirmation   { password }
    first_name              { '山だダ' }
    first_name_kana         { 'ヤマダ' }
    last_name               { '陸たロウ' }
    last_name_kana          { 'リクタロウ' }
  end
end
