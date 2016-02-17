class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    
    event=Event.new(name:params[:name],event_date:params[:event_date],location:params[:location],state:params[:state],user:current_user)
    puts event.inspect
    if event.save
      redirect_to "/events"
    else
      flash[:errors] = event.errors.full_messages
      redirect_to :back
    end
  end
  
end

