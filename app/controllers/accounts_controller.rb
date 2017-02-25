class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @user = User.find(session[:user_id])
    if @user.admin == '0'
      @accounts = Account.where("user_id = ?", session[:user_id])
    else
      @accounts = Account.all
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @accounts = Account.where('user_id = ?', :params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @account.save
    redirect_to home_page_url
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.status = 'rejected'
    @account.save
    redirect_to home_page_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:account_id, :balance, :status, :user_id)
    end
end
