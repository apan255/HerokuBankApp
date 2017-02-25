class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy, :search]

  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.where("user_id = ?", session[:user_id])
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
    Friend.create(:user_id => 1, :friend_id => 4)
  end

  # GET /friends/new
  def new
    @friend = Search.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    if params[:email].present?
      @searches = User.where("email LIKE '%john'")
    else if params[:name].present?
           @searches = User.where("name LIKE  ? ", "%"+ params[:search][:name] + "%")
         end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.require(:friend).permit(:status, :user_id, :friend_id)
    end
end
