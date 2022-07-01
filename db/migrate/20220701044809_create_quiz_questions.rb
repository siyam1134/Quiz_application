class CreateQuizQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_questions do |t|
      t.belongs_to :quiz
      t.text :question
      t.timestamps
    end
  end
end
