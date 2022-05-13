class Api::V1::AuthenticationController < Api::V1::BaseController
  def authenticate
    user = User.find_for_database_authentication(email: params[:email])
    if user&.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: { error: 'Invalid Username/Password' }, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user&.id

    {
      auth_token: JWT.encode({ user_id: user.id },
                             'API_18a285bfc1cfd050a2bab431c54685858425e9590d09c99123742fc3cc97a7f04e23
                             b18defe1bd8de406fc323ed3a779f94d43dfe06fd1edff8edc534e83009a', 'HS256'),
      user: { id: user.id, email: user.email }
    }
  end
end
