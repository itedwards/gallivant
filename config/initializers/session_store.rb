if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_gallivant_app", domain: "gallivant.herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key: "_gallivant_app"
end