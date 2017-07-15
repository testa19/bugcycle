FactoryGirl.define do
  factory :bicycle do
    sequence(:name) { |n| "Bicycle #{n}.0#{n}"}
    description {Faker::Lorem.paragraph}
    category

    factory :invalid_bike do
      name nil
    end
  end
end
