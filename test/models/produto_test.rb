require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase
  [:categoria_id, :nome, :preco, :quantidade].each { |key| should validate_presence_of(key) }
  should belong_to :categoria
  should have_many(:clientes).through(:pedidos)
  should have_many(:pedidos)
  should validate_uniqueness_of :nome
end
