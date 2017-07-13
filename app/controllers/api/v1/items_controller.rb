class Api::V1::ItemsController < ApplicationController
  before_action :set_api_v1_item, only: [:show, :update, :destroy]
  before_action :set_api_by_name_v1_item, only: [:getByname]

  # GET /api/v1/items
  def index
    get_api_v1_items
    render json: {
      status: 200,
      message: "Success",
      data: get_api_v1_items
    }.to_json
  end

  # GET /api/v1/items/1
  def show
    @api_v1_item = Item.select(:id, :name, :description, :unit).find(params[:id])
    if @api_v1_item
      render json: {
        status: 200,
        message: "Success",
        data: @api_v1_item
      }.to_json
    else
      render json: {
        status: 404,
        message: "Not Found"
      }.to_json
    end
  end

  # GET /api/v1/items/:name
  def getByName
    render json: {
      status: 200,
      message: "Success",
      data: @api_v1_items
    }.to_json
  end

  # POST /api/v1/items
  def create
    @api_v1_item = Item.new(api_v1_item_params)

    if @api_v1_item.save
      render json: {
        status: 201,
        message: "Success",
        data: @api_v1_item
      }.to_json
      # location: [:api, :v1, @api_v1_item]
    else
      render json: @api_v1_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/items/1
  def update
    if @api_v1_item.update(api_v1_item_params)
      render json: {
        status: 200,
        message: "Successfully update item",
        data: @api_v1_item
      }.to_json
    else
      render json: @api_v1_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/items/1
  def destroy
    if @api_v1_item.destroy
      render json: {
        status: 200,
        message: "Successfully deleted item"
      }.to_json
    else
      render json: @api_v1_item.errors, status: :unprocessable_entity
    end
  end

  private
    def get_api_v1_items
      @api_v1_items = Item.select(:id, :name, :description, :unit)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_item
      @api_v1_item = Item.select(:id, :name, :description, :unit).find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_api_by_name_v1_item
      @api_v1_items = Item.select(:id, :name, :description, :unit).where(name: params[:name])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_item_params
      params.require(:item).permit(:id, :name, :description, :unit)
    end
end
