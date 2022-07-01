class QuizzesController < ApplicationController
    before_action :authenticate_user!
    def index
        @quizzes = Quiz.all
        puts @quizzes.inspect
    end
    def new
        @quiz = Quiz.new
    end
    def create
        @quiz_created = Quiz.new(quiz_params)
        if @quiz_created.save!
            puts "Saved in database"
        end
        redirect_to root_path
    end
    def edit
        find_quiz
    end
    def update
        find_quiz
        @quiz.update(quiz_params)
        if @quiz.save!
            puts "Saved in database"
        end
        redirect_to root_path
    end
    def destroy
        find_quiz
        @quiz.destroy!
        redirect_to root_path
    end
    private
    def find_quiz
        @quiz = Quiz.find_by_id(params[:id])
    end
    def quiz_params
        params.require(:quiz).permit(:title, :description,:no_of_questions,:individual_mark,:cut_off_mark,:negative_mark,:user_id)
    end
end
