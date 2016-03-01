class Api::V1::TransactionTypesController < Api::V1::BaseController
  before_action :set_transaction_type, only: [:show, :edit, :update, :destroy]

  # GET /transaction_types
  # GET /transaction_types.json
  def index
    @transaction_types = TransactionType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transaction_types }
    end
  end

  # GET /transaction_types/1
  # GET /transaction_types/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction_type }
    end
  end

  # GET /transaction_types/new
  def new
    @transaction_type = TransactionType.new
  end

  # GET /transaction_types/1/edit
  def edit
  end

  # POST /transaction_types
  # POST /transaction_types.json
  def create
    @transaction_type = TransactionType.new(transaction_type_params)

    respond_to do |format|
      if @transaction_type.save
        format.html { redirect_to @transaction_type, notice: 'Transaction type was successfully created.' }
        format.json { render json: @transaction_type, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaction_types/1
  # PATCH/PUT /transaction_types/1.json
  def update
    respond_to do |format|
      if @transaction_type.update(transaction_type_params)
        format.html { redirect_to @transaction_type, notice: 'Transaction type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction_types/1
  # DELETE /transaction_types/1.json
  def destroy
    @transaction_type.destroy
    respond_to do |format|
      format.html { redirect_to transaction_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction_type
      @transaction_type = TransactionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_type_params
      params.require(:transaction_type).permit!
    end
end
