class Api::V1::TrucksController < Api::BaseApi
  before_action :set_truck, only: %i[ show update destroy ]

  # GET /trucks
  def index
    @trucks = Truck.all
    result = PaginationService.new(@trucks, page: params[:page]|| 1, per_page: params[:per_page] || 10).call
    records =  TruckSerializer.new(result[:records]).serializable_hash
    result[:records] = records
    render json: result
  end

  # GET /trucks/1
  def show
    render json: @truck
  end

  # POST /trucks
  def create
    @truck = Truck.new(truck_params)

    if @truck.save
      render json: @truck, status: :created
    else
      render json: @truck.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trucks/1
  def update
    if @truck.update(truck_params)
      render json: @truck
    else
      render json: @truck.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trucks/1
  def destroy
    @truck.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck
      @truck = Truck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def truck_params
      params.require(:truck).permit(:name, :truck_type)
    end
end
