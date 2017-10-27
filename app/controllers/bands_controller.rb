class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def create
    @band = Band.new(band_param)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = current_user.bands.find(params[:id])
    render :edit
  end

  def update
    @band = current_user.band.find(params[:id])
    if @band.update_attributes(band_param)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
  end

  def destroy
    @band = current_user.band.find(params[:id])
    if @band.delete
      redirect_to :index
    else
      flash.now[:errors] = @band.errors.full_messages
      render :destroy
  end

  private
  def band_param
    params.require(:band).permit(:name)
  end

end
