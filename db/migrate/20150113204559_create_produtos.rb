class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string  :nome
      t.integer :categoria_id
      t.float   :preco
      t.integer :quantidade
      t.timestamps
    end
  end
end
