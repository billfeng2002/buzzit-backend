class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_code
      t.integer :owner_id
      t.integer :current_question_id
      t.string :topic
      t.string :status

      t.timestamps
    end
  end
end
