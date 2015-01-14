class Categoria < ActiveRecord::Base
  has_many :produtos
  validates :nome, presence: true, uniqueness: true
end
