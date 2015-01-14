class Pedido < ActiveRecord::Base
  enum status: [ :pendente, :pago ]

  belongs_to :produto
  belongs_to :cliente

  validates_presence_of :produto_id, :cliente_id
  validates_associated :produto, :cliente
end
