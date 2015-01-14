FactoryGirl.define do
  factory :categoria do
     sequence(:nome) { |n| "Eletronicos#{n}"}
  end
end
