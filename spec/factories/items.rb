# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    leauge_id 1
    plaintext "MyString"
    description "MyText"
    name "MyString"
    group "MyString"
  end
end
