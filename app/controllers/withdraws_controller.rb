class WithdrawsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create

    if Integer(params[:amount]) > 1000
      @transaction = Transaction.new
      @transaction.amount = params[:amount]
      @transaction.from_account = Account.find(params[:account_num])
      @transaction.status = 'pending'
      @transaction.trans_type = 'withdraw'
      @transaction.trans_from_id = session[:user_id]
      @transaction.save
    else
      @account = Account.find_by(account_num: params[:account_num])
      @account.balance -= Float(params[:amount])
      @account.save
    end
    redirect_to accounts_path
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end
end
