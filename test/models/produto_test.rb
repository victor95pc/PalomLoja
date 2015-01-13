require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase
  [:categoria_id, :nome, :preco, :quantidade].each { |key| should validate_presence_of(key) }
  should belong_to :categoria
  should validate_uniqueness_of :nome

  setup do
    @categoria = create(:categoria)
  end


  test 'Retonar produtos organizados em categoria' do
    create(:produto, 20)
    assert_equal 21, Produto.por_categoria(@categoria).count
  end
end
