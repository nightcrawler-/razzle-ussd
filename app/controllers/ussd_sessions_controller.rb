class UssdSessionsController < ApplicationController
  before_action :set_ussd_session, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /ussd_sessions
  # GET /ussd_sessions.json
  def index
    @ussd_sessions = UssdSession.all
  end

  # GET /ussd_sessions/1
  # GET /ussd_sessions/1.json
  def show
  end

  # GET /ussd_sessions/new
  def new
    @ussd_session = UssdSession.new
  end

  # GET /ussd_sessions/1/edit
  def edit
  end

  # POST /ussd_sessions
  # POST /ussd_sessions.json
  def create
    @ussd_session = UssdSession.new(ussd_session_params)

    respond_to do |format|
      if @ussd_session.save
        format.html { redirect_to @ussd_session, notice: 'Ussd session was successfully created.' }
        format.json { render :show, status: :created, location: @ussd_session }
      else
        format.html { render :new }
        format.json { render json: @ussd_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ussd_sessions/1
  # PATCH/PUT /ussd_sessions/1.json
  def update
    respond_to do |format|
      if @ussd_session.update(ussd_session_params)
        format.html { redirect_to @ussd_session, notice: 'Ussd session was successfully updated.' }
        format.json { render :show, status: :ok, location: @ussd_session }
      else
        format.html { render :edit }
        format.json { render json: @ussd_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ussd_sessions/1
  # DELETE /ussd_sessions/1.json
  def destroy
    @ussd_session.destroy
    respond_to do |format|
      format.html { redirect_to ussd_sessions_url, notice: 'Ussd session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ussd_session
      @ussd_session = UssdSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ussd_session_params
      params.require(:ussd_session).permit(:session_id, :phone_number, :network_code, :service_code, :text)
    end
end
