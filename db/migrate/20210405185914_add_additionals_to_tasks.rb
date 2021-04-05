class AddAdditionalsToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :flg_tomorrow, :boolean
    add_column :tasks, :nbr_prio, :integer
  end
end
