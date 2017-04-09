Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.assets.debug = true

  config.assets.digest = true

  config.assets.raise_runtime_errors = true

  #config.action_mailer.raise_delivery_errors = true  

  config.action_mailer.default_url_options = { :host => 'localhost:3000' } 
  config.action_mailer.delivery_method = :smtp 
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  ActionMailer::Base.smtp_settings = { 
    :address => "smtp.gmail.com", 
    :port => 587, 
    :authentication => :plain, 
    :domain => 'gmail.com', 
    :user_name => 'vimimp2@gmail.com', 
    :password => ENV['V1nc3nz01972'] 
  }
end
