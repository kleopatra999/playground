require 'factory_girl'

FactoryGirl.define do
  factory :member, class: User do
    email 'member@gmail.com'
    password '11111111'
    password_confirmation '11111111'
    role :member
  end

  factory :admin, class: User do
    email 'admin@gmail.com'
    password '11111111'
    password_confirmation '11111111'
    role :admin
  end
end
