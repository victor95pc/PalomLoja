ActiveAdmin.register Categoria do
  permit_params :nome

  index do
    selectable_column
    column :nome
    column :created_at
    actions
  end

  filter :nome
  filter :created_at

  form do |f|
    f.inputs "Dados Categoria" do
      f.input :nome
    end
    f.actions
  end

end
