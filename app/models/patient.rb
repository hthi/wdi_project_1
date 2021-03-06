class Patient < ActiveRecord::Base
  validates :name, :dob, :mrn, :email, presence: true
  has_many :appointments, dependent: :destroy

  #SQL to find matches for what params are entered in the search bar
  def self.search(search)
    if search
    self.where("name || mrn || dob || email iLIKE ?", "%#{search}%")
    else
      self.all
  end
end
end
