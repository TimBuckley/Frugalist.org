class MessagesController < ApplicationController
  def index
    @convos = Convo.all
    @messages = Message.where(author_id: current_user.id)
    Message.where(recipient_id: current_user.id).each {|msg| @messages << msg}
    @messages.sort! { |a,b| a.created_at <=> b.created_at }
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
    convo = Convo.find_by_pairing(pairing)
    if p[0] == p[1]
      flash[:errors] = ["You can't message yourself!"]
      redirect_to :new
    else 
      if convo.nil?
        convo = Convo.new(pairing: pairing)
        convo.save
      end
      params[:message][:convo_id] = convo.id
      
      @message = Message.new(
        convo_id: params[:message][:convo_id],
        author_id: current_user.id,
        recipient_id: params[:message][:recipient_id],
        body: params[:message][:body]
      )
      if @message.save
        @messages = Message.where(author_id: current_user.id)
        Message.where(recipient_id: current_user.id).each {|msg| @messages << msg}
        redirect_to messages_url
      else
        @messages = Message.where(author_id: current_user.id)
        Message.where(recipient_id: current_user.id).each {|msg| @messages << msg}
        render :index
      end
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    
    @messages = Message.where(author_id: current_user.id)
    Message.where(recipient_id: current_user.id).each {|msg| @messages << msg}

    render :index
  end


end
