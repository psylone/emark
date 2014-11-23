class Grade < ActiveRecord::Base

  has_many :subjects
  has_many :users

end
