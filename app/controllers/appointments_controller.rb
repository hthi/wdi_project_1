class AppointmentsController < ApplicationController
  def new
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.new
    flash[:success] = 'Appointment succesfully created.'
  end

  def show
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.find(params[:id])
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
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.find(params[:id])
    flash[:success] = 'Patient info successfully updated'
  end

  def update
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.find(params[:id])

    if @appointment.update_attributes(appointment_params)
      redirect_to patient_path(@patient), :flash => { :success => "Appointment successfully created" }
    else
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.find(params[:id])
    @appointment.destroy
    flash[:success] = 'Appointment successfully deleted.'
    redirect_to patient_path(@patient)
  end


  private
  def appointment_params
    params.require(:appointment).permit(:date, :time, :provider_name)
  end

end
