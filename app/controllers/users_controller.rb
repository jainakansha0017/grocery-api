class UsersController < ApiController
  skip_before_action :authorize_request, only: :create

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.mobile_number, user.password).call
    response = {
      data: {
         message: Message.account_created, auth_token: auth_token
       }
     }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(
      :first_name,
      :last_name,
      :mobile_number,
      :email,
      :password,
      :password_confirmation
    )
  end
end
