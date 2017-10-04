Devise.setup do |config|
  config.mailer_sender = "金のフレーズ <#{ENV.fetch('GP_EMAIL')}>"
  if Rails.env.production?
    config.secret_key = ENV.fetch("SECRET_KEY_BASE")
  end
end
