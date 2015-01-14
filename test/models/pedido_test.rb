require 'test_helper'

class PedidoTest < ActiveSupport::TestCase
  should belong_to(:cliente)
  should belong_to(:produto)

  [:cliente_id, :produto_id].each { |key| should validate_presence_of key }
end
