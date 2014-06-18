class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
