class Api::V1::FragrancesController < ApplicationController
  before_action :set_fragrance, only: [:show, :update, :destroy]

  # GET /fragrances
  def index
    @fragrances = Fragrance.all
    render json: @fragrances.all
  end

  # GET /fragrance/:id
  def show
    render json: @fragrance
  end

  # POST /fragrances
  def create
    @fragrance = Fragrance.new(fragrance_params)

    if @fragrance.save
      render json: @fragrance, status: :created
    else
      render json: { error: 'error' }, status: :unprocessable_entity
    end
  end

  # PUT /fragrances/:id
  def update
    if @fragrance.update(fragrance_params)
      render json: @fragrance, status: :ok
    else
      render json: { error: 'error' }, status: :unprocessable_entity
    end
  end

  # DELETE /fragrances/:id
  def destroy
    @fragrance.destroy
  end

  private

  def set_fragrance
    @fragrance = Fragrance.find(params[:id])
  end

  def fragrance_params
    params.require(:fragrance).permit(:name, :description, :category, :image_url)
  end
end
