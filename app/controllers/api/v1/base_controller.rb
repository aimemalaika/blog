class Api::V1::BaseController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    render json: { error: 'Record not found' }, status: 404
  end

  def current_user
    token = request.headers['Authorization'].split.last
    decoded_token = JWT.decode(token,
                               'API_18a285bfc1cfd050a2bab431c54685858425e9590d09c99123742fc3cc97a7f04e23b18def
                               e1bd8de406fc323ed3a779f94d43dfe06fd1edff8edc534e83009a', true, { algorithm: 'HS256' })
    user_id = decoded_token.first['user_id']
    User.find(user_id)
  end
end
