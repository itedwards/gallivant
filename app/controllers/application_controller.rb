class ApplicationController < ActionController::Base
  # skip csrf handling so that it can be managed by front end
  skip_before_action :verify_authenticity_token
end
