class AdvertsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @adverts = Advert.all
  end

  def show
    @advert = Advert.find(params[:id])
  end

  def new
    @advert = current_user.adverts.new
  end

  def create
    @advert = current_user.adverts.new(strong_params)
    if @advert.save
      flash[:notice] = "Dodano nowe ogłoszenie"
      redirect_to adverts_path
    else
      flash[:error] = "Nie udało się dodać ogłoszenia"
      render :new
    end
  end

private

  def strong_params
    params.require(:advert).permit(:title, :description, :price)
  end
end