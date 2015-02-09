class Appointment < ActiveRecord::Base
  belongs_to :patient
  has_many :details, dependent: :destroy
  validates :date, :time, :provider_name, presence: true
end
