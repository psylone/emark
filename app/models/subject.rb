class Subject < ActiveRecord::Base

  validates :title, presence: true

  has_many :subject_lines
  belongs_to :teacher, class_name: 'User', foreign_key: :user_id
  belongs_to :grade

end
