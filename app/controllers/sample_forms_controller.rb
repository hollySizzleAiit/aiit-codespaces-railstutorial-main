class SampleFormsController < ApplicationController
  before_action :set_sample_form, only: %i[ show edit update destroy ]

  # GET /sample_forms or /sample_forms.json
  def index
    @sample_forms = SampleForm.all
  end

  # GET /sample_forms/1 or /sample_forms/1.json
  def show
  end

  # GET /sample_forms/new
  def new
    @sample_form = SampleForm.new
  end

  # GET /sample_forms/1/edit
  def edit
  end

  # POST /sample_forms or /sample_forms.json
  def create
    @sample_form = SampleForm.new(sample_form_params)

    respond_to do |format|
      if @sample_form.save
        format.html { redirect_to sample_form_url(@sample_form), notice: "Sample form was successfully created." }
        format.json { render :show, status: :created, location: @sample_form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sample_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sample_forms/1 or /sample_forms/1.json
  def update
    respond_to do |format|
      if @sample_form.update(sample_form_params)
        format.html { redirect_to sample_form_url(@sample_form), notice: "Sample form was successfully updated." }
        format.json { render :show, status: :ok, location: @sample_form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sample_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sample_forms/1 or /sample_forms/1.json
  def destroy
    @sample_form.destroy

    respond_to do |format|
      format.html { redirect_to sample_forms_url, notice: "Sample form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample_form
      @sample_form = SampleForm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sample_form_params
      params.require(:sample_form).permit(:text, :password, :search, :tel, :url, :email, :number, :range, :color, :date, :datetime_local, :month, :week, :time, :checkbox, :radio, :file, :hidden)
    end
end
