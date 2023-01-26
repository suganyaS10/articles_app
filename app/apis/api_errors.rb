module ApiErrors
  FailedResponseError = Class.new(StandardError)
  UnknownResponseType = Class.new(StandardError)
end
