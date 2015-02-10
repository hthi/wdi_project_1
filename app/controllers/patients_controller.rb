class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    @patients = Patient.search(params[:search])
end


  def new
    @patient = Patient.new
    flash[:success] = 'Patient successfully created.'
  end

  def show
    @patient = Patient.find(params[:id])
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
    @patient = Patient.find(params[:id])
    flash[:success] = 'Patient was successfully created'
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update_attributes(patient_params)
      flash[:success] = 'Patient info successfully updated'
      redirect_to patient_path(@patient)
    else
      render :edit
    end
  end

  def destroy
    Patient.find(params[:id]).destroy
    flash[:success] = 'Patient entry successfully deleted.'
    redirect_to patients_path
  end

  private
  def patient_params
    params.require(:patient).permit(:name, :dob, :mrn, :email)
  end
end
