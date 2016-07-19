class CoursesController < ApplicationController
  def index
    render locals: {
      courses: Course.all
    }
  end

  def show
    render locals: {
      course: Course.find(params[:id])
    }
  end

  def new
    render locals: {
      course: Course.new
    }
  end

  def create
    course = Course.new(course_params)
    if course.save
      redirect_to course
    else
      render :new
    end
  end

  def edit
    render locals: {
      course: Course.find(params[:id])
    }
  end

  def update
    course = Course.find(params[:id])
    if Course.update(course_params)
      redirect_to course
    else
      render :edit
    end
  end

  def destroy
    if Course.exists?(params[:id])
      Course.destroy(params[:id])
      flash[:notice] = "Course destroyed."
      redirect_to course_path
    else
      flash[:alert] = "Course was not deleted due to errors."
    end
  end

  private
  def course_params
    params.require(:course).permit(:name, :school_id)
  end
end
