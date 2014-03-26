# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reason, :class => 'Reasons' do
    text "MyString"
  end
end
