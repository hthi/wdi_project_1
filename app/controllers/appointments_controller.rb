class AppointmentsController < ApplicationController
  before_action :set_appt, only: [:show, :edit, :update, :destroy]

  def new
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.new
  end

  def show
    @details = @appointment.details
    @detail = @appointment.details.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.new(appointment_params)
    if @appointment.save
      redirect_to patient_path(@patient), :flash => { :success => "Appointment successfully created" }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update_attributes(appointment_params)
      redirect_to patient_path(@patient), :flash => { :success => "Appointment successfully created" }
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    flash[:success] = 'Appointment successfully deleted.'
    redirect_to patient_path(@patient)
  end

  private
  def set_appt
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :time, :provider_name)
  end

end
