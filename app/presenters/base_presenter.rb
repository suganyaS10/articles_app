class BasePresenter < SimpleDelegator
  attr_accessor :record, :options

  def initialize(record, options = {})
    @record = record
    @options = options
    super(record)
  end
end
