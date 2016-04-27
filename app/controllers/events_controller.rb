class EventsController < ApplicationController
  
  before_action :load_venue

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.venue_id = @venue.id

    if @event.save
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to venue_event_path(@venue, @event)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to venue_path(@venue)
  end

  protected

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date, :ad, :description)
  end

  def load_venue
    @venue = Venue.find(params[:venue_id])
  end

end