class ImportTrucksWorker
  include Sidekiq::Worker

  sidekiq_options retry: 3

  def perform
    Truck.import_from_api
  end
end