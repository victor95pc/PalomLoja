require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase
  [:categoria_id, :nome, :preco, :quantidade].each { |key| should validate_presence_of(key) }
  should belong_to :categoria
  should have_many(:clientes).through(:pedidos)
  should have_many(:pedidos)
  should validate_uniqueness_of :nome


  test 'Retonar produtos organizados em categoria' do
    categoria = create(:categoria)
    create_list(:produto, 20, categoria: categoria)
    assert_equal 20, Produto.por_categoria(categoria).count
  end
end
