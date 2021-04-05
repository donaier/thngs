class CreateLnks < ActiveRecord::Migration[6.1]
  def change
    create_table :lnks do |t|
      t.integer :list_id
      t.text :text
      t.text :href
      t.integer :creator
      t.datetime :completed_at
      t.integer :completed_from

      t.timestamps
    end
  end
end
