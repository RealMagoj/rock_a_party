class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def create
    @venue = Venue.new(venue_params)
    @venue_photo = VenuePhoto.new(venue_photo_params)
    @venue.user_id = current_user.id

    if @venue.save
      @venue_photo.venue_id = @venue.id
      @venue_photo.save
      redirect_to venues_path
    else
      render :new
    end
  end

  def update
    @venue = Venue.find(params[:id])

    if @venue.update_attributes(venue_params)
      redirect_to venue_path(@venue)
    else
      render :edit
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to venues_path
  end

  protected

  def venue_params
    params.require(:venue).permit(:name, :logo, :address, :phone_number, :capacity, :avg_drink_price, :age_range, :description)
  end

  def venue_photo_params
    params.require(:venue_photo).permit(:photo)
  end

end