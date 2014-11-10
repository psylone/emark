class Subject < ActiveRecord::Base

  validates :title, presence: true

  has_many :subject_lines
  belongs_to :user
  belongs_to :grade

end
