class LecturesController < ApplicationController
  before_filter :authenticate_user!
  before_action :assign_lecture, only: [:show, :edit, :update]

  def index
    @lectures = Lecture.where user: current_user
  end

  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = current_user.lectures.build lecture_params

    if @lecture.save
      redirect_to @lecture
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @lecture.update lecture_params
      redirect_to @lecture
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def assign_lecture
    @lecture = Lecture.find params[:id]
  end

  def lecture_params
    params.require(:lecture).permit [:title, :subtitle, :length, :language, :abstract, :description, :notes, :track_id]
  end
end