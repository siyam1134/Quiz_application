class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.belongs_to :user
      t.text :description
      t.integer :no_of_questions
      t.integer :individual_mark
      t.integer :cut_off_mark
      t.integer :negative_mark
      t.timestamps
    end
  end
end
