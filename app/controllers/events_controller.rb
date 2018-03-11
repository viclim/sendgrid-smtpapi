class EventsController < ActionController::API
  before_action :authenticate

  def create
    params['_json'].each do |json|
      CreateEventWorker.perform_async(json.to_json)
    end
    head :ok
  end

  private

  def authenticate
    head 401 if params['password'] != Rails.configuration.authentication[:password]
  end
end
