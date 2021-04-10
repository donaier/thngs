class AddBoardIdToLnks < ActiveRecord::Migration[6.1]
  def change
    add_column :lnks, :board_id, :integer
  end
end
