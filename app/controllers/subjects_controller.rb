class SubjectsController < ApplicationController

  before_action :teacher_required, only: :index

  def index
    @subjects = current_user.subjects.pluck(:title).uniq
  end

end