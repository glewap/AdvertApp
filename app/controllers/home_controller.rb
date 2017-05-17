class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @adverts = Advert.all
  end

  def show
    @advert = Advert.find(params[:id])
  end
end
