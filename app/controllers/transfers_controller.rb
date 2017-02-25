class TransfersController < ApplicationController
  def new
    @transaction = Transaction.new
    @friends = Friend.find(session[:user_id])
  end

  def create
    @user_account = Account.find_by(account_num: params[:account_num])
    if @user_account.balance >= Float(params[:amount])
      @user_account.balance -= Float(params[:amount])
      @user_account.save
      @friend_account = Account.find_by(user_id: params[:friend])
      @friend_account.balance += Float(params[:amount])
      @friend_account.save
    else
      format.json { render json: @user_account.errors, status: :'No sufficeint balance to transfer' }
    end
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
