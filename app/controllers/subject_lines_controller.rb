class SubjectLinesController < ApplicationController

  before_action :teacher_required, only: :marks
  before_action :find_grade, only: :marks
  before_action :find_subject, only: :marks

  def index
    @subject_lines ||= current_user.subject_lines
  end

  def marks
    @subject_lines ||= @grade.users.map{ |user| user.subject_lines.where(subject_id: @subject.id).first }
  end

  def update_marks
    Mark.update_values params[:marks]
    redirect_to :back, notice: 'Информация об оценках обновлена.'
  end


  private

  def find_grade
    @grade ||= Grade.find params[:grade_id]
  end

  def find_subject
    @subject ||= current_user.subjects.where(title: params[:subject_id], grade_id: params[:grade_id]).first
  end

end