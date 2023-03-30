class FlatsController < ApplicationController

  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(require)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_id
    @flat = Flat.find(params[:id])
  end

  def require
    params.require(:flat).permit(:title, :address, :description, :price_per_night, :number_of_guests, :user_id)
  end
end
