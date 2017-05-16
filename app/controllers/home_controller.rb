class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @adverts = Advert.active.all
  end

  def show
    @advert = Advert.active.find(params[:id])
  end

end