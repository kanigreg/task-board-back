require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test 'create' do
    todo = create :todo
    assert todo.persisted?
  end
end
