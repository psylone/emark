class Mark < ActiveRecord::Base

  def self.update_values marks
    marks.each do |mark|
      where(subject_line_id: mark[:subject_line_id]).first.update_attributes value: mark[:value]
    end
  end

end
