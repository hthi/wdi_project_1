class Patient < ActiveRecord::Base
  validates :name, :dob, :mrn, :email, presence: true
  has_many :appointments
end
