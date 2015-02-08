class Appointment < ActiveRecord::Base
  belongs_to :patient
  has_many :details
  validates :date, :time, :provider_name, presence: true
end
