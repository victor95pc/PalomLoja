FactoryGirl.define do
  factory :pedido do
    association :cliente
    association :categoria
  end
end
