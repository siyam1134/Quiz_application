class CreateQuizQuestionAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_question_answers do |t|
      t.belongs_to :quiz_question
      t.string :option
      t.boolean :is_true, :default=>0
      t.timestamps
    end
  end
end
