class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def show
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Success!"
      redirect_to questions_path
    else
      flash.now[:notice] = "Error!"
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
