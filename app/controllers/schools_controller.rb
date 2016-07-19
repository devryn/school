class SchoolsController < ApplicationController
  def index
    render locals: {
      schools: School.all
    }
  end

  def show
    render locals: {
      school: School.find(params[:id])
    }
  end

  def new
    render locals: {
      school: School.new
    }
  end

  def create
    school = School.new(school_params)
    if school.save
      redirect_to school
    else
      render :new
    end
  end

  def edit
    render locals: {
      school: School.find(params[:id])
    }
  end

  def update
    school = School.find(params[:id])
    if School.update(school_params)
      redirect_to school
    else
      render :edit
    end
  end

  def destroy
    if School.exists?(params[:id])
      School.destroy(params[:id])
      flash[:notice] = "School destroyed."
      redirect_to schools_path
    else
      flash[:alert] = "School was not deleted due to errors."
    end
  end

  private
  def school_params
    params.require(:School).permit(:name)
  end
end
