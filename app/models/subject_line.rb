class SubjectLine < ActiveRecord::Base

  has_many :marks
  belongs_to :user
  belongs_to :subject

end
