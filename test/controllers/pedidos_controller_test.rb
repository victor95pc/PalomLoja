require 'test_helper'

class PedidosControllerTest < ActionController::TestCase
  setup do
    @cliente = create(:cliente)
    sign_in @cliente
    @pedido = create(:pedido, cliente: @cliente)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create pedido" do
    assert_difference('Pedido.count') do
      post :create, pedido: { cliente_id: @cliente, produto_id: @pedido.produto }
    end
    assert_redirected_to root_path
  end

  test "should destroy pedido" do
    assert delete :destroy, id: @pedido
    assert_redirected_to pedidos_path
  end
end
