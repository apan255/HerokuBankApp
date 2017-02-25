class PendtransactionsController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def history
    @transactions = Transaction.where("status = 'approved' or status = 'declined' or status = 'pending'")
    print @transactions
  end

  def edit
    @transactions = Transaction.find(params[:id])
    if @transactions.trans_type == 'deposit'
      @account  = Account.find(@transactions.from_account)
      @account.balance += @transactions.amount
      @account.save
      @transactions.status = 'approved'
      @transactions.save
    elsif @transactions.trans_type == 'withdrawal'
    end
    redirect_to pendtransactions_path
  end

  def destroy
    print "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
  end

  def index
    @transactions = Transaction.where("status = 'pending'")
  end

  def show
    @transactions = Transaction.find(params[:id])
    @account  = Account.find(@transactions.from_account)
    @transactions.status = 'rejected'
    @transactions.save
    redirect_to pendtransactions_path
  end
end
