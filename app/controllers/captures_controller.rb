class CapturesController < ApplicationController
  before_action :set_capture, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /captures
  # GET /captures.json
  def index
    @captures = Capture.last(20)

  end

  # GET /captures/1
  # GET /captures/1.json
  def show
  end

  # GET /captures/new
  def new
      if user_signed_in?
        @capture = Capture.new
      else
        respond_to do |format|
          format.html {redirect_to captures_path, alert: "Necesita estar registrado para subir una captura"}
        end
      end
  end

  # GET /captures/1/edit
  def edit
    unless current_user == @capture.user 
      respond_to do |format|
        format.html{ redirect_to captures_path, alert: "No esta autorizado a editar esta captura" }
      end
    end
  end

  # POST /captures
  # POST /captures.json
  def create
    @capture = Capture.new(capture_params)

    respond_to do |format|
      if @capture.save
        format.html { redirect_to @capture, notice: 'Captura guardada correctamente' }
        format.json { render action: 'show', status: :created, location: @capture }
      else
        format.html { render action: 'new' }
        format.json { render json: @capture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /captures/1
  # PATCH/PUT /captures/1.json
  def update
    respond_to do |format|
      if @capture.update(capture_params)
        format.html { redirect_to @capture, notice: 'Captura actualizada correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @capture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /captures/1
  # DELETE /captures/1.json
  def destroy
    @capture.destroy
    respond_to do |format|
      format.html { redirect_to captures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capture
      @capture = Capture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def capture_params
      params.require(:capture).permit(:altitude, :latitude, :longitude, :temperature, :description, :humidity, :environment_description, :time, :user_id, :season_id, :region_id, :capture_type_id, :image)
    end
end