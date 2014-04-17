# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :glimpse do
    template_id 1
    ip_address "MyString"
    latitude 1.5
    longitude 1.5
    location "MyString"
  end
end
