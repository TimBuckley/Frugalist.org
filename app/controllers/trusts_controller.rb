class TrustsController < ApplicationController
  
  def index
    @trustees = current_user.trustees
    @entrustors = current_user.entrustors
    render :index
  end
  
  def create
    user = User.find_by_username(params[:trust][:trustee])
    @trustees = current_user.trustees
    @entrustors = current_user.entrustors
    
    if user.nil?
      flash[:alert] = ["No such user!"]
      render partial: "transactions/trustee_list"
    elsif user == current_user
      flash[:alert] = ["You can't entrust yourself"]
      render partial: "transactions/trustee_list"
    elsif !current_user.trustees.where(trustee_id: user.id).empty?
      flash[:alert] = ["You've already entrusted this user."]
      render partial: "transactions/trustee_list"
    else

      @trustee = current_user.trustees.new(trustee_id: user.id)
    
      unless @trustee.save
        flash[:errors] = @trustee.errors.full_messages
      end
      
      @trustees = current_user.trustees
      @entrustors = current_user.entrustors

      if request.xhr?
        render partial: "transactions/trustee_list"
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

    if request.xhr?
      render partial: "transactions/trustee_list"
    else
      redirect_to trusts_url
    end
  end
  
  def trustee_detail
    
  end
  
end
