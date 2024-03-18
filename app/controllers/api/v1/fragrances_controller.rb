class Api::V1::FragrancesController < ApplicationController
  # Note: consider using custom monday object to sync fragrances

  # GET /fragrances
  def index
    @fragrances = Fragrance.all
    render json: @fragrances.all
  end

  # GET /fragrance/:id
  def show
    @fragrance = Fragrance.find(params[:id])
    render json: @fragrance
  end

  # create the dropdown label
  def create
    @fragrance = Fragrance.new(fragrance_params)

    if @fragrance.save
      render json: @fragrance
    else
      render json: { error: 'error' }, status: 400
    end
  end

  # update the dropdown label
  def update
    @fragrance = Fragrance.find(params[:id])

    if @fragrance
      @fragrance.update(fragrance_params)
    else
    end
  end

  # DELETE /fragrances/:id
  # delete the dropdown label
  def destroy
    @fragrance = Fragrance.find(params[:id])

    if @fragrance
      @fragrance.destroy
      render json: @fragrance
    else
      render json: { error: 'error' }, status: 400
    end
  end

  # webhooks to keep dropdown labels in sync

  private

  def fragrance_params
    params.require(:user).permit(:name, :description, :category, :image_url)
  end
end
