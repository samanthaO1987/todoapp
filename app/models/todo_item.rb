class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  def completed?
    completed_at.present?
  end

  def completed!
    update_column(:completed_at, Time.now)
  end

  def revert!
    update_column(:completed_at, nil)
  end
end