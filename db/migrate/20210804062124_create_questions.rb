class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :value
      t.string :image_url
      t.string :type
      t.boolean :anonymous
      t.integer :room_id

      t.timestamps
    end
  end
end
