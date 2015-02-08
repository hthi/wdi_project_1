class Appointment < ActiveRecord::Base
  belongs_to :patient
  validates :date, :time, :provider_name, presence: true
end
