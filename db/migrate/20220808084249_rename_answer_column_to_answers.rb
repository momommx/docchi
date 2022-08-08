class RenameAnswerColumnToAnswers < ActiveRecord::Migration[6.1]
  def change
    rename_column :answers, :answer, :answer_content
  end
end
