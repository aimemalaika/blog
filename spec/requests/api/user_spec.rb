require 'swagger_helper'
RSpec.describe 'api/v1/user', type: :request do
  path '/login' do
    post 'Login' do
      tags 'User'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, example: 'aimemalaika@gmail.com' },
          password: { type: :string, example: '12345678' }
        },
        required: %w[email password]
      }
      response '200', { message: 'Login Successful', auth_token: 'ds4324323h2h4h32h432' } do
        let(:user) { { email: 'aimemalaika@gmail.com', password: '12345678' } }
        run_test!
      end
    end
  end
  path '/users' do
    get 'Get all users' do
      tags 'User'
      consumes 'application/json'
      response '200', 'Get all users' do
        run_test!
      end
    end
  end
  path '/users/{id}' do
    get 'Get a user' do
      tags 'User'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'Get a user' do
        run_test!
      end
    end
  end
end