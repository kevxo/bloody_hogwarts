class StudentsController < ApplicationController
  def index
   @students = Student.all
   @average = Student.average(:age).round
  end

  def show
    @student = Student.find(params[:id])
  end
end