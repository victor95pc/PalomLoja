FactoryGirl.define do
  factory :produto do
    sequence(:nome) { |n| "Computador#{n}"}
    preco 15.50
    quantidade 10
    association :categoria
  end
end
