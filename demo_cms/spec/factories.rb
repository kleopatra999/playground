require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email 'greatghoul@gmail.com'
    password '11111111'
    password_confirmation '11111111'
    role :admin
  end

  factory :user do
    email 'member@gmail.com'
    password '11111111'
    password_confirmation '11111111'
    role :member
  end
end
