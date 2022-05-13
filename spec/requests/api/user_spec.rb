require 'swagger_helper'

RSpec.describe 'api/user', type: :request do
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
      response '200', 'Login Successful' do
        let(:user) { { email: 'aimemalaika@gmail.com', password: '12345678' } }
        run_test!
      end
    end
  end
end
