class QuizzesController < ApplicationController
    before_action :authenticate_user!
    def index
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
    private
    def quiz_params
        params.require(:quiz).permit(:title, :description,:no_of_questions,:individual_mark,:cut_off_mark,:negative_mark,:user_id)
    end
end
