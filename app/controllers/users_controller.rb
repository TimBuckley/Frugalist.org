class UsersController < ApplicationController
  before_filter :require_current_user!, :only => [:show]
  before_filter :require_no_current_user!, :only => [:create, :new]

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    cat_spend_data
    spend_over_time
    

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
  
  
  def cat_spend_data
    valid_user_ids = current_user.entrustors.pluck("entrustor_id") + [current_user.id]
    @shared_trans = Transaction.where(user_id: valid_user_ids)
    @categories = []
    @shared_trans.each {|e|  @categories << e.category if e.privacy == "shared"}
    @categories.uniq!

    @cat_spend_series = []

    valid_user_ids.each do |user_id|
      data_hash = {}
      data_hash[:name] = User.find(user_id).username
      
      spend_array = []
      @categories.each do |cat|
        cat_spend_array = @shared_trans.where(user_id: user_id, category: cat, privacy: "shared").pluck("amount")
        spend_array << cat_spend_array.inject(0.0){|sum,x| sum + x }
      end
      data_hash[:data] = spend_array
      
      @cat_spend_series << data_hash
    end
  end
  
  def spend_over_time
    valid_user_ids = current_user.entrustors.pluck("entrustor_id") + [current_user.id]
    @shared_trans = Transaction.where(user_id: valid_user_ids, privacy: "shared")

    @time_spend_series = []

    valid_user_ids.each do |user_id|
      data_hash = {}
      data_hash[:name] = User.find(user_id).username
      
      user_trans = @shared_trans.where(user_id: user_id)
      
      date_spend_pairs = []
      
      user_trans.each do |tran|
        date_spend_pair = [tran.date, 
          tran.amount.to_f]
        date_spend_pairs << date_spend_pair
      end
      data_hash[:data] = date_spend_pairs
      @time_spend_series << data_hash
    end
  end
  
  
  
end
