class DetailsController < ApplicationController
  before_action :find_appt, only: [:new, :create, :destroy]

  def new
    @detail = @appointment.details.new
  end

  def create
    @detail = @appointment.details.new(detail_params)
    if @detail.save
      redirect_to patient_appointment_path(@appointment.patient_id, @appointment)
    else
      render :new
    end
  end

  def destroy
    @detail = @appointment.details.find(params[:id])
    @detail.destroy
    redirect_to patient_appointment_path(@appointment.patient_id, @appointment)
  end

  private
  def find_appt
    @appointment = Appointment.find(params[:appointment_id])
  end

  def detail_params
    params.require(:detail).permit(:assessments, :duration, :add_notes)
  end
end
