class AddStuffToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :board_time, :string
    add_column :users, :extra_board_id, :integer
    add_column :users, :extra_time, :string
  end
end
