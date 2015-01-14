class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.integer :cliente_id
      t.integer :produto_id
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
