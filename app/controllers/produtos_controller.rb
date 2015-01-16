class ProdutosController < ApplicationController

  def index
    @produtos = Produto.all
  end

  def show
    @produto = Produto.find(params[:id])
  end

  def por_categoria
    @categoria = Categoria.includes(:produtos).find_by_nome params[:nome]
    @produtos  = @categoria.produtos
    render 'index'
  end
end
