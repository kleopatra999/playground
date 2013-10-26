require 'factory_girl'

FactoryGirl.define do
  factory :topic do
    sequence(:title) { |n| "title #{n}"}
    sequence(:content) { |n| "content #{n}"}
    sequence(:visible) { |n| Topic.visible.values[n % 2] }
  end
end
