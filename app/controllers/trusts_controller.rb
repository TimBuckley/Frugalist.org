class TrustsController < ApplicationController
  
  def index
    @trustees = current_user.trustees
    # @trustees.sort! { |a,b| a.username <=> b.username }
    @entrustors = current_user.entrustors
    # @entrustors.sort! { |a,b| a.username <=> b.username }
    render :index
  end
  
  def create
    user = User.find_by_username(params[:trust][:trustee])
    @trustee = current_user.trustees.new(trustee_id: user.id)
    
    unless @trustee.save
      flash[:errors] = @trustee.errors.full_messages
    end
    
    @trustees = current_user.trustees
    # @trustees.sort! { |a,b| a.username <=> b.username }
    @entrustors = current_user.entrustors
    # @entrustors.sort! { |a,b| a.username <=> b.username }
    
    render :index
  end
  

  # def show
  #   render :show
  # end
  # 
  # def edit
  #   @transactions = current_user.transactions.all
  #   render :index
  # end

  # def update
 #    @transaction = Transaction.find_by_id(params[:id])
 #    if @transaction.update_attributes(params[:transaction])
 #      flash[:errors] = @transaction.errors.full_messages
 #    else
 #      flash[:errors] = @transaction.errors.full_messages
 #    end
 # 
 #    @transactions = current_user.transactions.all
 #    @transactions.sort! { |a,b| b.date <=> a.date }
 #    @transactions.sort! { |a,b| b.created_at <=> a.created_at }
 #    redirect_to transactions_url
 #  end

 
  def destroy
    @transaction = Transaction.find_by_id(params[:id])
    @transaction.destroy
    @transactions = current_user.transactions.all
    @transactions.sort! { |a,b| b.date <=> a.date }
    @transactions.sort! { |a,b| b.created_at <=> a.created_at }
    redirect_to transactions_url
  end
  
end
