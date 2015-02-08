class DetailsController < ApplicationController
  def new
    @appointment = Appointment.find(params[:appointment_id])
    @detail = @appointment.details.new
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @detail = @appointment.details.new(detail_params)
    if @detail.save
      redirect_to patient_appointment_path(@appointment.patient_id, @appointment)
    else
      render :new
    end
  end

  def destroy
    @appointment = Appointment.find(params[:appointment_id])
    @detail = @appointment.details.find(params[:id])
    @detail.destroy
    redirect_to patient_appointment_path(@appointment.patient_id, @appointment)
  end

  private
  def detail_params
    params.require(:detail).permit(:assessments, :duration, :add_notes)
  end
end
