class TimesheetsController < ApplicationController
  before_action :set_timesheet, only: %i[ show edit update destroy ]

  # GET /timesheets or /timesheets.json
  def index
    @timesheet = Timesheet.new
    @timesheets = current_user.timesheets
    @work_orders = policy_scope(WorkOrder).all
  end

  # GET /timesheets/1 or /timesheets/1.json
  def show
  end

  # GET /timesheets/new
  def new
    @timesheet = Timesheet.new
    @work_orders = policy_scope(WorkOrder).all
  end

  # GET /timesheets/1/edit
  def edit
    @work_orders = current_user.work_orders
  end

  # POST /timesheets or /timesheets.json
  def create
    @timesheet = current_user.timesheets.build(timesheet_params)
    @work_orders = current_user.work_orders
 
    respond_to do |format|
      if @timesheet.save
        format.html { redirect_to timesheet_url(@timesheet), notice: "Timesheet was successfully created." }
        format.json { render :show, status: :created, location: @timesheet }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  # PATCH/PUT /timesheets/1 or /timesheets/1.json
  def update
    respond_to do |format|
      if @timesheet.update(timesheet_params)
        format.html { redirect_to timesheet_url(@timesheet), notice: "Timesheet was successfully updated." }
        format.json { render :show, status: :ok, location: @timesheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheets/1 or /timesheets/1.json
  def destroy
    @timesheet.destroy

    respond_to do |format|
      format.html { redirect_to timesheets_url, notice: "Timesheet was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet
      @timesheet = current_user.timesheets.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timesheet_params
      params.require(:timesheet).permit(:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :start_at, :work_order_id)
    end
end
