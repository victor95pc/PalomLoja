class Cliente < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable,
         :trackable, authentication_keys: [:username]

  has_many :produtos, through: :pedidos
  has_many :pedidos

  validates_presence_of :name, :username

  validates_presence_of      :password, on: :create
  validates_confirmation_of  :password, on: :create
  validates_length_of        :password, maximum: 25, minimum: 4, on: :create


  def checkout
    pedidos.pendente.update_all(status: Pedido.statuses[:pago])
  end

  def to_s
    name
  end
end
