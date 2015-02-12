class PatientsController < ApplicationController
  before_action :find_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all

    #find patients with entered params
    @patients = Patient.search(params[:search])
  end


  def new
    @patient = Patient.new
  end

  def show
    @appointments = @patient.appointments
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      flash[:success] = 'Patient was successfully created'
      redirect_to patients_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update_attributes(patient_params)
      flash[:success] = 'Patient info successfully updated'
      redirect_to patient_path(@patient)
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    flash[:success] = 'Patient entry successfully deleted.'
    redirect_to patients_path
  end

  private
  def find_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :dob, :mrn, :email)
  end
end
