ActiveAdmin.register Pedido do
  permit_params :cliente, :produto

  index do
    selectable_column
    column :cliente
    column :produto
    column :created_at
    actions
  end

  filter :cliente
  filter :produto
  filter :created_at

  form do |f|
    f.inputs "Dados Pedido" do
      f.input :cliente
      f.input :produto
    end
    f.actions
  end

end
