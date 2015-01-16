#encoding: UTF-8

class PedidosController < InheritedResources::Base
  before_action :verificar_cliente

  def index
    @pedidos  = Pedido.includes(:produto).where(cliente: current_cliente)
  end

  def create
    pedido = Pedido.new(pedido_params)
    pedidos(root_path, 'Pedido foi adicioando a sua lista', 'Erro ao adicionar o pedido') { pedido.save }
  end

  def destroy
    pedido = Pedido.find(params[:id])
    pedidos(pedidos_path, 'Pedido foi removido da sua lista', 'Erro ao remover o pedido') { pedido.destroy }
  end

  private
  def pedidos(path, message_accept, message_error)
    if yield
      redirect_to path, notice: message_accept
    else
      redirect_to path, notice: message_error
    end
  end

  def verificar_cliente
    unless cliente_signed_in?
      redirect_to new_cliente_session_path, notice: 'Você precisa de uma conta antes de comprar algo'
    end
  end

  def pedido_params
    params.require(:pedido).permit(:cliente_id, :produto_id)
  end
end

