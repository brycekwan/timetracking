class WorkOrdersController < ApplicationController
  before_action :set_work_order, only: %i[ show edit update destroy ]

  # GET /work_orders or /work_orders.json
  def index
    @work_orders = WorkOrder.all
    @projects = Project.all
    @users = User.all
  end

  # GET /work_orders/1 or /work_orders/1.json
  def show
  end

  # GET /work_orders/new
  def new
    @work_order = WorkOrder.new
    @projects = Project.all
    @users = User.all
  end

  # GET /work_orders/1/edit
  def edit
    @projects = Project.all
    @users = User.all
  end

  # POST /work_orders or /work_orders.json
  def create
    @work_order = WorkOrder.new(work_order_params)
    @projects = Project.all
    @users = User.all

    respond_to do |format|
      if @work_order.save
        format.html { redirect_to work_order_url(@work_order), notice: "Work order was successfully created." }
        format.json { render :show, status: :created, location: @work_order }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  # PATCH/PUT /work_orders/1 or /work_orders/1.json
  def update
    respond_to do |format|
      if @work_order.update(work_order_params)
        format.html { redirect_to work_order_url(@work_order), notice: "Work order was successfully updated." }
        format.json { render :show, status: :ok, location: @work_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_orders/1 or /work_orders/1.json
  def destroy
    @work_order.destroy

    respond_to do |format|
      format.html { redirect_to work_orders_url, notice: "Work order was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_order_params
      params.require(:work_order).permit(:start_at, :end_at, :project_id, :user_id, :rate)
    end
end
