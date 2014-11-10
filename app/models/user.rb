class User < ActiveRecord::Base

  include Authentication

  attr_accessor :password

  email_regex = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  validates :fio, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: email_regex }
  validates :password, presence: true,
                       confirmation: true
  validates :password_confirmation, presence: true

  has_many :subject_lines
  has_many :subjects
  belongs_to :grade

  scope :students, -> { where(is_teacher: false) }
  scope :teachers, -> { where(is_teacher: true) }

end
