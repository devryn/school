class SchoolnsController < ApplicationController
  def index
    render locals: {
      schoolns: Schooln.all
    }
  end

  def show
    render locals: {
      schoolns: Schooln.find(params[:id])
    }
  end

  def new
    render locals: {
      schooln: Schooln.new
    }
  end

  def create
    schooln = Schooln.new(schooln_params)
    if schooln.save
      redirect_to schooln
    else
      render :new
    end
  end

  def edit
    render locals: {
      schooln: Schooln.find(params[:id])
    }
  end

  def update
    schooln = Schooln.find(params[:id])
    if schooln.update(schooln_params)
      redirect_to schooln
    else
      render :edit
    end
  end

  def destroy
    if Schooln.exists?(params[:id])
      Schooln.destroy(params[:id])
      flash[:notice] = "School destroyed."
      redirect_to schoolns
    else
      flash[:alert] = "School was not deleted due to errors."
    end
  end

  private
  def schooln_params
    params.require(:schooln).permit(:name)
  end
end
