require 'httparty'
class TrucksClient
  def initialize
    @api_key = ENV['TRUCKS_API_KEY']
    @url = "https://task-api-8etf.onrender.com/api/v1/trucks"
    @trucks = []
  end

  def get_all_trucks
    page = 1
    total_count = nil
    total_pages = nil

    while total_pages.nil? || page <= total_pages
      response = HTTParty.get(@url, query: { page: page }, headers: { 'API_KEY' => @api_key })
      data = JSON.parse(response.body)
      total_count ||= response.headers['total-count'].to_i
      total_pages ||= response.headers['total-pages'].to_i

      @trucks += data
      page += 1

    end

    @trucks
  end
end