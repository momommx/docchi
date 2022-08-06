class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :book_id
      t.string  :answer,  null: false
      t.string  :option,  null: false
      t.timestamps
    end
  end
end
