class QuizQuestionsController < ApplicationController
    def create
        @question = QuizQuestion.new(question_params)
        @question.save!
        for i in 1..4
            @ques_ans = QuizQuestionAnswer.new
            @ques_ans.quiz_question_id = @question.id
            if params["option"+i.to_s]
                @ques_ans.option = params["option"+i.to_s]
            end
            if params[:answer_option] and params[:answer_option].to_i == i
                @ques_ans.is_true = true
            end
            @ques_ans.save!
        end
        respond_to do |format|
            format.js {render "create"}
        end
    end

    def destroy
        @question = QuizQuestion.find_by_id(params[:id])
        @question.destroy!
    end
    private
    def question_params
        params.require(:quiz_question).permit(:question,:quiz_id)
    end
end
