class GradesController < ApplicationController

  before_action :teacher_required, only: :index
  before_action :find_grades, only: :index

  def index
  end


  private

  def find_grades
    grade_ids = current_user.subjects.where(title: params[:subject_id]).pluck :grade_id
    @grades = Grade.find grade_ids
  end

end