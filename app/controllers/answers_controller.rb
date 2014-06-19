class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Success!"
      redirect_to @question
    else
      flash.now[:notice] = "Sorry, we couldn't save your answer."
      render 'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end
end
