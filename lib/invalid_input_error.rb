class InvalidInputError < StandardError
  def initialize(msg = 'Invalid input')
    super(msg)
  end
end
