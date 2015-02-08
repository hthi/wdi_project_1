class Detail < ActiveRecord::Base
  belongs_to :appointment
  validates :assessments, :duration, presence: true
end
