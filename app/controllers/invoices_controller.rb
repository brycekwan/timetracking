class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show edit update destroy]

  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1 or /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @vendors = Vendor.all
    @projects = Project.all
  end

  # GET /invoices/1/edit
  def edit
  end

  def preview
    preview_params = params.permit(:vendor_id, :project_id, :start_at, :end_at)
    @results = InvoiceGenerator.new(
      vendor_id: preview_params[:vendor_id],
      project_id: preview_params[:project_id],
      start_at: preview_params[:start_at],
      end_at: preview_params[:end_at],
    ).create
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html do
          redirect_to invoice_url(@invoice),
                      notice: "Invoice was successfully created."
        end
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @invoice.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html do
          redirect_to invoice_url(@invoice),
                      notice: "Invoice was successfully updated."
        end
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @invoice.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html do
        redirect_to invoices_url, notice: "Invoice was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def invoice_params
    params.require(:invoice).permit(
      :vendor_id,
      :company_id,
      :number,
      :issued_at,
      :due_at,
      :term,
    )
  end
end
