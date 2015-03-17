class TodoItemsController < ApplicationController
  before_action :get_todo_list
  before_action :get_todo_item, except: [:create]

  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    redirect_to @todo_list
  end

  def destroy
    @todo_item.destroy
    flash[:success] = "Todo List item was deleted"
    redirect_to @todo_list
  end

  def complete
    @todo_item.completed!
    redirect_to @todo_list, notice: "Todo item completed"
  end

  def revert
    @todo_item.revert!
    redirect_to @todo_list
  end

  private

  def get_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def get_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end
end
