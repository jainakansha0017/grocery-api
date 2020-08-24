class AuthenticateUser
  def initialize(mobile_number, password)
    @mobile_number = mobile_number
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :mobile_number, :password

  # verify user credentials
  def user
    user = User.find_by(mobile_number: mobile_number)
    return user if user && user.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end