class HomeController < ApplicationController

  def index
    @adverts = Advert.active.all
  end

  def show
    @advert = Advert.active.find(params[:id])
  end

end