# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AdminUser.create!(email: 'victor@email.com', password: '12345678', password_confirmation: '12345678')
cliente   = Cliente.create!(name: 'Victor', username: 'victor', password: '12345678', password_confirmation: '12345678')
categoria = Categoria.create!(nome: 'Eletronicos')
produto   = Produto.create!(nome: 'Computador', preco: 12.0, quantidade: 2, categoria: categoria)

Pedido.create! cliente: cliente, produto: produto
