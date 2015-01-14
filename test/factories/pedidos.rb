FactoryGirl.define do
  factory :pedido do
    association :cliente
    association :produto
  end
end
