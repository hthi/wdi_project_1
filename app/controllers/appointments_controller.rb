class AppointmentsController < ApplicationController
  def new
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.new
  end

  def show
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.find(params[:id])
  end
end
