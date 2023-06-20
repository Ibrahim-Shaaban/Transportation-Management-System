class Api::V1::DriversController < Api::BaseApi
  before_action :set_driver, only: %i[ show update destroy ]
  before_action only: [:assign_truck, :trucks ] do
    authorized
  end

  # GET /drivers
  def index
    @drivers = Driver.all

    render json: @drivers
  end

  def assign_truck
    begin
      Driver.handle_assignment(current_driver, params[:truck_id])
      render json: "assigned successfully"
    rescue => e
      render json: e, status: :unprocessable_entity
    end

  end

  def trucks
    render json: AssignmentSerializer.new(current_driver.assignments).serializable_hash
  end

  def sign_in
    begin
      login_data = Driver.handle_login(params[:email], params[:password])
      render json: login_data
    rescue => e
      render json: e, status: :unauthorized
    end

  end

  # GET /drivers/1
  def show
    render json: @driver
  end

  # POST /drivers
  def create
    @driver = Driver.create_new_one(params[:name], params[:email], params[:password])

    if @driver.save
      render json: @driver, status: :created
    else
      render json: @driver.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /drivers/1
  def update
    if @driver.update(driver_params)
      render json: @driver
    else
      render json: @driver.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drivers/1
  def destroy
    @driver.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def driver_params
      params.require(:driver).permit(:name, :email, :password)
    end
end
