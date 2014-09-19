class CaptureTypesController < ApplicationController
  before_action :set_capture_type, only: [:show, :edit, :update, :destroy]

  # GET /capture_types
  # GET /capture_types.json
  def index
    @capture_types = CaptureType.all
  end

  # GET /capture_types/new
  def new
    @capture_type = CaptureType.new
  end

  # GET /capture_types/1/edit
  def edit
  end

  # POST /capture_types
  # POST /capture_types.json
  def create
    @capture_type = CaptureType.new(capture_type_params)

    respond_to do |format|
      if @capture_type.save
        format.html { redirect_to capture_types_path, notice: 'Capture type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @capture_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @capture_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /capture_types/1
  # PATCH/PUT /capture_types/1.json
  def update
    respond_to do |format|
      if @capture_type.update(capture_type_params)
        format.html { redirect_to capture_types_path, notice: 'Capture type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @capture_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capture_types/1
  # DELETE /capture_types/1.json
  def destroy
    @capture_type.destroy
    respond_to do |format|
      format.html { redirect_to capture_types_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capture_type
      @capture_type = CaptureType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def capture_type_params
      params.require(:capture_type).permit(:name)
    end
end
