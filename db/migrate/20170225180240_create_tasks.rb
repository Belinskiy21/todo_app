class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :content, null: false
      t.boolean :done, null: false, default: false
      t.integer :list_id, null: false

      t.timestamps
    end
  end
end
