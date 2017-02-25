class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    if session[:user_admin] == '1'
      @transactions = Transaction.where("status = ?", "pending")
    else
      @transactions = Transaction.where("trans_from_id = ?", session[:user_id])
    end
  end

  def deposit
    print 'in dpositttttt'
      @transactions = Transaction.where("status = ?", "pending")
  end
  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transaction = Transaction.find(params[:id])
    @transaction.status = 'rejected'
    @transaction.save
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
    @transaction.status = 'accepted'
    @transaction.save
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.status = 'rejected'
    @transaction.save
  end

  def history
    print 'in destroyyyyyyyyy'
    @transaction = Transaction.find(params[:id])
    @transaction.status = 'rejected'
    @transaction.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:amount, :trans_type, :status, :trans_from_id, :trans_to_id, :start_date, :end_date, :from_account_id, :to_account_id)
    end
end
