class Categoria < ActiveRecord::Base
  has_many :produtos
  validates :nome, presence: true, uniqueness: true

  def to_s
    nome
  end
end
