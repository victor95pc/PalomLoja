require 'test_helper'

class ClienteTest < ActiveSupport::TestCase
  should have_many(:produtos).through(:pedidos)
  should have_many(:pedidos)
  should validate_confirmation_of :password

  [:name, :username, :password].each { |key| should validate_presence_of(key) }

  context 'password' do
    subject { Cliente.new username: 'victor95' }
    should ensure_length_of(:password).is_at_least(4).is_at_most(25)
  end

  setup do
    @cliente = build(:cliente)
  end

  test 'Testar o checkout das compras' do
    produto = create(:produto)
    @cliente.save
    @cliente.pedidos = create_list(:pedido, 2, cliente: @cliente, produto: produto)
    @cliente.checkout
    assert_equal 2, Pedido.pago.count, 'Erro ao pagar os produtos'
  end

  test 'Criando clientes' do
    assert @cliente.valid?, 'Falha ao criar o cliente'
  end
end
