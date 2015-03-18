require 'test_helper'

class TodoItemTest < ActiveSupport::TestCase

  test "completed?" do
    assert todo_items(:complete).completed?
    assert_not todo_items(:incomplete).completed?
  end

  test "marked as completed" do
    item = todo_items(:incomplete)
    item.completed!
    assert item.completed?
  end

  test "revert completed item" do
    item = todo_items(:complete)
    item.revert!
    assert_nil item.completed_at
    assert_not item.completed?
  end
end
