HTTP.default_options = HTTP::Options.new(
  features: {
    logging: {
      logger: Rails.logger
    }
  }
)
