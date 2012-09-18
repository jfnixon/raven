# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :art do
    yubikey "MyText"
    user nil
    book nil
  end
end
