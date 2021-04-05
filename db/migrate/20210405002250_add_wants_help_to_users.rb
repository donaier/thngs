class AddWantsHelpToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :wants_help, :boolean, default: true
  end
end
