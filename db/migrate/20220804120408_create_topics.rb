class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.integer :user_id     
      t.integer :genre_id    
      t.string  :topic_title, null: false
      t.string  :option1,     null: false
      t.string  :option2,     null: false
      t.timestamps
    end
  end
end
