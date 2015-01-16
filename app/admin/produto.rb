ActiveAdmin.register Produto do
  permit_params :nome, :quantidade, :preco, :categoria

  index do
    selectable_column
    column :nome
    column :quantidade
    column :preco
    column :categoria
    column :created_at
    actions
  end

  filter :nome
  filter :quantidade
  filter :preco
  filter :created_at

  form do |f|
    f.inputs "Dados Produtos" do
      f.input :nome
      f.input :quantidade
      f.input :preco
      f.input :categoria
    end
    f.actions
  end

end
