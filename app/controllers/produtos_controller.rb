class ProdutosController < ApplicationController
  before_action :categorias

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

  private
  def categorias
    @categorias = Categoria.all
  end
end
