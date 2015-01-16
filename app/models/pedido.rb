class Pedido < ActiveRecord::Base
  before_save   :verificar_estoque
  after_destroy :devolver_estoque
  enum status: [ :pendente, :pago ]

  belongs_to :produto
  belongs_to :cliente

  validates_presence_of :produto_id, :cliente_id
  validates_associated :produto, :cliente


  def self.valor_total(pedidos)
    total = 0
    pedidos.each do |pedido|
      total += pedido.produto.preco
    end
    total
  end

  private
  def verificar_estoque
    if produto.quantidade > 0
      produto.quantidade -= 1
      produto.save
    else
      errors.add(:produto, 'Produto fora de estoque')
      false
    end
  end

  def devolver_estoque
    produto.quantidade += 1
    produto.save
  end
end
