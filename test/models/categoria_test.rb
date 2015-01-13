require 'test_helper'

class CategoriaTest < ActiveSupport::TestCase

  should validate_presence_of(:nome)
  should validate_uniqueness_of(:nome)
  should have_many(:produtos)
end
