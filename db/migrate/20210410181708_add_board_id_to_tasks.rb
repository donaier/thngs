class AddBoardIdToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :board_id, :integer
  end
end
