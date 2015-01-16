#encoding: UTF-8

class PedidosController < InheritedResources::Base
  before_action :verificar_cliente

  def index
    @pedidos = Pedido.includes(:produto).where(cliente: current_cliente).pendente
    @total   = Pedido.valor_total @pedidos
  end

  def create
    pedido = Pedido.new(pedido_params)
    if pedido.save
      redirect_to root_path, notice: 'Pedido foi adicinado a sua lista'
    else
      redirect_to root_path, alert: pedido.errors.full_messages.join
    end
  end

  def destroy
    pedido = Pedido.includes(:produto).find(params[:id])
    redirect_validator(pedidos_path, "Pedido foi removido da sua lista (#{pedido.produto.nome})", 'Erro ao remover o pedido') { pedido.destroy }
  end

  def checkout
    redirect_validator(root_path, 'Todos os pedidos foram pagos', 'Erro ao pagar os pedidos') { current_cliente.checkout }
  end

  private
  def redirect_validator(path, message_accept, message_error)
    if yield
      redirect_to path, notice: message_accept
    else
      redirect_to path, alert: message_error
    end
  end

  def verificar_cliente
    unless cliente_signed_in?
      redirect_to new_cliente_session_path, alert: 'Você precisa de uma conta antes de comprar algo'
    end
  end

  def pedido_params
    params.require(:pedido).permit(:cliente_id, :produto_id)
  end
end

