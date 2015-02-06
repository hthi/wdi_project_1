class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
    flash[:success] = 'Patient successfully created.'
  end

  def show
    @patient = Patient.find(params[:id])
  end

end
