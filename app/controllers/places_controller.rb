class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.all.paginate(page: params[:page], per_page: 5)
    @photos = Photo.last.photograph.url
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)

    if @place.valid?
      redirect_to place_path(@place)
    else
      return render :new, status: :unprocessable_entity
    end
  end

  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
    @photo = Photo.new
  end

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render plain: 'Only the original creator is allowed to edit this place.', status: :forbidden
    end

  end

  def update
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render plain: 'Only the original creator is allowed to edit this place.', status: :forbidden
    end

    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to place_path(@place)
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render plain 'Not allowed', status: :forbidden
    end

    @place.destroy
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

end
