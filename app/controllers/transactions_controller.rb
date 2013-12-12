class TransactionsController < ApplicationController
  def index
    @transactions = current_user.transactions.all
    @transactions.sort! { |a,b| b.date <=> a.date }
    @transactions.sort! { |a,b| b.created_at <=> a.created_at }
    render :index
  end

  def show
    render :show
  end

  def new
    render :new
  end

  def edit
    @transactions = current_user.transactions.all
    @transactions.sort! { |a,b| b.date <=> a.date }
    @transactions.sort! { |a,b| b.created_at <=> a.created_at }
    render :index
  end

  def update
    @transaction = Transaction.find_by_id(params[:id])
    if @transaction.update_attributes(params[:transaction])
      flash[:errors] = @transaction.errors.full_messages
    else
      flash[:errors] = @transaction.errors.full_messages
    end

    @transactions = current_user.transactions.all
    @transactions.sort! { |a,b| b.date <=> a.date }
    @transactions.sort! { |a,b| b.created_at <=> a.created_at }
    redirect_to transactions_url
  end

  def create
    params[:transaction][:user_id] = current_user.id
    @transaction = Transaction.new(params[:transaction])
    unless @transaction.save
      flash[:errors] = @transaction.errors.full_messages
    end
    
    @transactions = current_user.transactions.all
    @transactions.sort! { |a,b| b.date <=> a.date }
    @transactions.sort! { |a,b| b.created_at <=> a.created_at }
    render :index
  end

  def destroy
    @transaction = Transaction.find_by_id(params[:id])
    @transaction.destroy
    @transactions = current_user.transactions.all
    @transactions.sort! { |a,b| b.date <=> a.date }
    @transactions.sort! { |a,b| b.created_at <=> a.created_at }
    redirect_to transactions_url
  end

end
