require 'test_helper'

class ProdutosControllerTest < ActionController::TestCase
  test 'mostrar produto' do
    get :show, id: create(:produto)
    assert_response :success
  end

  test 'testar index' do
    get :index
    assert_response :success
  end

  test 'Produtos por categoria' do
    categoria = create(:categoria)
    get :por_categoria, nome: categoria.nome
    assert_response :success
  end
end