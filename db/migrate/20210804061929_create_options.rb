class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.integer :question_id
      t.string :value
      t.boolean :is_correct

      t.timestamps
    end
  end
end
