FactoryGirl.define do
  factory :produto do
    sequence(:nome) { |i| "Computador#{i}"}
    preco 15.50
    quantidade 10
    association :categoria
  end
end
