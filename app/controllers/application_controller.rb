class ApplicationController < ActionController::Base
  http_basic_authenticate_with(
    name:     Rails.configuration.authentication[:username],
    password: Rails.configuration.authentication[:password],
  )
end
