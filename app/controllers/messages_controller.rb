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
    params[:message][:recipient_id] = User.find_by_username(params[:message][:recipient]).id
    params[:message][:author_id] = current_user.id
    p = [params[:message][:recipient_id],params[:message][:author_id]]
    p.sort!
    pairing = p[0].to_s + "a" + p[1].to_s
    if p[0] == p[1]
      flash[:errors] = ["You can't message yourself!"]
      redirect_to :new
    else 
      Convo.find_by_pairing(pairing)
    
      convo = Convo.find_by_user
    
    
      fail
      @message = Message.new(params)
      if @message.save
        redirect_to messages_url
      else
        render :index
      end
    end
  end


end
