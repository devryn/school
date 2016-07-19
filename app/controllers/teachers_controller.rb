class TeachersController < ApplicationController
  def index
    render locals: {
      teachers: Teacher.all
    }
  end

  def show
    render locals: {
      teacher: Teacher.find(params[:id])
    }
  end

  def new
    render locals: {
      teacher: Teacher.new
    }
  end

  def create
    teacher = Teacher.new(teacher_params)
    if teacher.save
      redirect_to teacher
    else
      render :new
    end
  end

  def edit
    render locals: {
      teacher: Teacher.find(params[:id])
    }
  end

  def update
    teacher = Teacher.find(params[:id])
    if teacher.update(teacher_params)
      redirect_to teacher
    else
      render :edit
    end
  end

  def destroy
    if Teacher.exists?(params[:id])
      Teacher.destroy(params[:id])
      flash[:notice] = "Teacher destroyed."
      redirect_to teachers
    else
      flash[:alert] = "Teacher was not deleted due to errors."
    end
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :schooln_id)
  end
end
