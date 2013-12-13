class ConvosController < ApplicationController

  def index
    @convos = Convo.all
    render :index
  end
  
  




end
