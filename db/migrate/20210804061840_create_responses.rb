class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :option_id

      t.timestamps
    end
  end
end
