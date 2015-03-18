require 'test_helper'

class TodoItemsControllerTest < ActionController::TestCase
  setup do
    @todo_list = todo_lists(:one)
  end

  test "mark as complete" do
    todo_list = todo_lists(:two)
    patch :complete, todo_list_id: todo_list, id: todo_items(:incomplete)
    assert_redirected_to todo_list
  end

  test "revert completed item" do
    patch :revert, todo_list_id: @todo_list, id: todo_items(:complete)
    assert_redirected_to @todo_list
  end

  test "item creation" do
    assert_difference('TodoItem.count') do
      post :create, todo_list_id: @todo_list, todo_item: { content: "Get job" }
    end
    assert_redirected_to @todo_list
  end

  test "item deletion" do
    assert_difference('TodoItem.count', -1) do
      delete :destroy, todo_list_id: @todo_list, id: todo_items(:complete)
    end
    assert_redirected_to @todo_list
  end
end