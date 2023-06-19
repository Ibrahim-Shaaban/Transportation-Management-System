class Api::V1::AccountsController < Api::BaseApi


  # GET /accounts
  # @return [nil]
  def index
    render json: { account: "working" }
  end

  def get_data
    render json: 'wefwef'
  end



end