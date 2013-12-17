class UsersController < ApplicationController
  before_filter :require_current_user!, :only => [:show]
  before_filter :require_no_current_user!, :only => [:create, :new]

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to user_url(@user)
    else
      render :json => @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  def show
    @trans = Transaction.all

    #Transactions where 
    #   1) user_id = current_user.id, OR
    #   2) user_id = trustee_id
    
    
    if params.include?(:id)
      @user = User.find(params[:id])
    else
      redirect_to user_url(current_user)
    end
    
    # respond_to do |format|
#       format.html { redirect_to user_url(current_user) }
#       # if JSON is requested, send back the emails in jsonified format.
#       format.json { render :json => @trans }
#     end
        # 
    # 
    # if request.xhr?
    #   render partial: "cats/cat_bio", 
    #         locals: {
    #           user: @user, 
    #           trans: @transactions
    #         }
    # else
    #   render :show
    # 
    
    
  end
end
