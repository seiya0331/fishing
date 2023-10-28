# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    text { Faker::Lorem.characters(number:20) }
    user
  end
end