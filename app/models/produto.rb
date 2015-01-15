class Produto < ActiveRecord::Base
  has_many :pedidos
  has_many :clientes, through: :pedidos
  belongs_to :categoria

  validates_uniqueness_of :nome
  validates_presence_of :nome, :quantidade, :preco, :categoria_id
  validates_associated :categoria
end
