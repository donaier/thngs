class AddSortToBoardsAndLists < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :sort, :integer
    add_column :lists, :sort, :integer
  end
end
