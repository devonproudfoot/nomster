class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:id])
    @place.photos.create(comment_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :photograph)
  end

end
