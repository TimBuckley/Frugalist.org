class MessagesController < ApplicationController
  def index
    @convos = Convo.all
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
    fail
    @message = Message.new(params)
    if @message.save
      redirect_to messages_url
    else
      render :index
    end
  end


end
