class AddHomeBoardToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :home_board_id, :integer
  end
end
