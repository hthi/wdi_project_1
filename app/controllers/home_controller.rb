class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    if @patient = Patient.where(email: current_user.email).first
      redirect_to patient_path(@patient.id)
    elsif current_user.admin?
      redirect_to patients_path
    else
      render 'index'
    end

  end
end
