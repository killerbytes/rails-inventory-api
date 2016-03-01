class Api::V1::TransactionsController < Api::V1::BaseController
	require 'date'
	before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  # before_filter :authenticate_user!

  # GET /transactions
  # GET /transactions.json
  def index
  	@sale = TransactionType.where(:name => 'TRANSACTION_SALE' ).first
    @transactions = Transaction.where.not(:type_id => @sale.id)
	if params[:start_date].present?
	    start_date = params[:start_date].to_date
	end
	if params[:end_date].present?
	    end_date = params[:end_date].to_date
	end

	if params[:start_date].present? && params[:end_date].present?
		@transactions = @transactions.where("updated_at between (?) and (?)", start_date, end_date)
	else
		@transactions = @transactions.all
	end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }

    end
  end

  def sales
  	@sale = TransactionType.where(:name => 'TRANSACTION_SALE' ).first
	if params[:start_date].present?
	    start_date = params[:start_date].to_date
	end
	if params[:end_date].present?
	    end_date = params[:end_date].to_date
	end

	if params[:start_date].present? && params[:end_date].present?
		@transactions = Transaction.where("updated_at between (?) and (?)", start_date, end_date)
		@transactions = @transactions.where(:type_id => @sale.id)
	else
		@transactions = Transaction.where(:type_id => @sale.id)
	end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }

    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
	# if transaction_params[:orders]
	# 	transaction_params[:orders_attributes] = transaction_params[:orders]
	# 	transaction_params.delete(:orders)
	# end  	
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.json { render json: @transaction, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
	if transaction_params[:orders]
		transaction_params[:orders_attributes] = transaction_params[:orders]
		# @transaction.orders.destroy_all
		transaction_params.delete(:orders)
	end  	
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transactions).permit(:id, :amount, :type_id, :notes, :user_id, :void, orders_attributes: [:product_id, :name, :price, :quantity])
    end
end