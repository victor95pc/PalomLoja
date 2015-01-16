ActiveAdmin.register Cliente do
  permit_params :username, :name, :password, :password_confirmation

  index do
    selectable_column
    column :username
    column :name
    column :current_sign_in_at
    column :created_at
    actions
  end

  filter :username
  filter :name
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Dados Cliente" do
      f.input :username
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
