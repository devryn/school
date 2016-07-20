class StudentsController < ApplicationController
    def index
      render locals: {
        students: Student.all
      }
    end

    def show
      render locals: {
        students: Student.find(params[:id])
      }
    end

    def new
      render locals: {
        student: Student.new
      }
    end

    def create
      student = Student.new(student_params)
      student.name = params[:student][:name]
      if student.save
        redirect_to student
      else
        render :new
      end
    end

    def edit
      render locals: {
        student: Student.find(params[:id])
      }
    end

    def update
      student = Student.find(params[:id])
      if student.update(student_params)
        redirect_to student
      else
        render :edit
      end
    end

    def destroy
      if Student.exists?(params[:id])
        Student.destroy(params[:id])
        flash[:notice] = "Student destroyed."
        redirect_to student
      else
        flash[:alert] = "Student was not deleted due to errors."
      end
    end

  private
  def student_params
    params.require(:student).permit(:name, :teacher_id)
  end
end
