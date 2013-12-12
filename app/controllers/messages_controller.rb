class MessagesController < ApplicationController
  def index
    @messages = Message.all
    render :index
  end

  def show
    @message = Message.find(:id)
  end

  def new
    render :new
  end

  def create
    @message = Message.new
    if @message.save
      redirect_to messages_url
    else

      render :index
    end
  end



end
