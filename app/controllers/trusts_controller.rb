class TrustsController < ApplicationController
  
  def index
    @trustees = current_user.trustees
    @entrustors = current_user.entrustors
    render :index
  end
  
  def create
    user = User.find_by_username(params[:trust][:trustee])
    if user.nil?
      flash[:errors] = ["No such user!"]
      @trustees = current_user.trustees
      @entrustors = current_user.entrustors
      redirect_to trusts_url
    elsif user == current_user
      flash[:errors] = ["You can't entrust yourself."]
      @trustees = current_user.trustees
      @entrustors = current_user.entrustors
      redirect_to trusts_url
    elsif !current_user.trustees.where(trustee_id: user.id).empty?
      flash[:errors] = ["You've already entrusted this user."]
      @trustees = current_user.trustees
      @entrustors = current_user.entrustors
      redirect_to trusts_url
    else

      @trustee = current_user.trustees.new(trustee_id: user.id)
    
      unless @trustee.save
        flash[:errors] = @trustee.errors.full_messages
      end
      
      @trustees = current_user.trustees
      @entrustors = current_user.entrustors
      
      if request.xhr?
        render partial: "transactions/trustee_list"# , locals: {cat: @cat}
      else
        redirect_to trusts_url
      end
    end
    
  end
  
  def show
    # fail
    redirect_to trust_url()
  end
  

  def destroy
    @trust = Trust.find_by_id(params[:id])
    @trust.destroy
    
    @trustees = current_user.trustees
    @entrustors = current_user.entrustors
    redirect_to trusts_url
  end
  
  def trustee_detail
    
  end
  
end
