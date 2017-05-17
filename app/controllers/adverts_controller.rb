class AdvertsController < ApplicationController
  def index
    @adverts = current_user.adverts.all
  end

  def show
    @advert = current_user.adverts.find(params[:id])
  end

  def new
    @advert = current_user.adverts.new
    @advert_cat = Category.where(parent_id: 2)
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

  def edit
    @advert = current_user.adverts.find(params[:id])
  end

  def update
    @advert = current_user.adverts.find(params[:id])
    if @advert.update(strong_params)
      flash[:notice] = "Ogłoszenie zostało zaktualizowane"
      redirect_to adverts_path
    else
      flash[:error] = "Nie udało się zaktualizować ogłoszenia"
      render :edit
    end
  end

  def destroy
    advert = current_user.adverts.find(params[:id])
    advert.destroy
    flash[:notice] = "Usunięto ogłoszenie: #{advert.title}"
    redirect_to adverts_path
  end

private
  def strong_params
    params.require(:advert).permit(:title, :description, :price)
  end

  def ancestry_options(items, &block)
    return ancestry_options(items){ |i| "#{'-' * i.depth} #{i.name}" } unless block_given?

    result = []
    items.map do |item, sub_items|
      result << [yield(item), item.id]
      #this is a recursive call:
      result += ancestry_options(sub_items, &block)
    end
    result
  end
end
