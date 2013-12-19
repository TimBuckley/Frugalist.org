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
    
    valid_user_ids = current_user.entrustors.pluck("entrustor_id") + [current_user.id]
    @trans = Transaction.where(user_id: valid_user_ids)
    @categories = []
    @trans.each {|e|  @categories << e.category if e.privacy == "shared"}
    @categories.uniq!

    @data_series = []

    valid_user_ids.each do |user_id|
      data_hash = {}
      data_hash[:name] = User.find(user_id).username
      
      spend_array = []
      @categories.each do |cat|
        cat_spend_array = @trans.where(user_id: user_id, category: cat, privacy: "shared").pluck("amount")
        spend_array << cat_spend_array.inject(0.0){|sum,x| sum + x }
      end
      data_hash[:data] = spend_array
      
      @data_series << data_hash
    end
    
    
    

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
  
  
  def date_parse(orig_date)
    
  end
  
end
