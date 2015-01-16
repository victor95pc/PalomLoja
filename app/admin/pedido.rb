ActiveAdmin.register Pedido do
  permit_params :cliente, :produto

  scope :pendente
  scope :pago

  index do
    selectable_column
    column :status do |pedido|
      status_tag(pedido.status)
    end
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
      f.input :cliente, as: :select
      f.input :produto, as: :select
      f.input :status, as: :select, collection: Pedido.statuses.keys.map{|p| [p.humanize, Pedido.statuses[p]]}
    end
    f.actions
  end

end
