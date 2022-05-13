require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
  path '/users/{user_id}/posts/{post_id}/comments' do
    get 'Get all comments' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :post_id, in: :path, type: :string
      response '200', 'Get all comments' do
        run_test!
      end
    end
  end

  path '/users/{user_id}/posts/{post_id}/comments' do
    post 'Create a comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter bearer_token: :header, in: :header, type: :string
      parameter name: :post_id, in: :path, type: :string
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          content: { type: :string, example: 'This is a comment' }
        },
        required: %w[content]
      }
      response '201', 'Create a comment' do
        let(:user_id) { '1' }
        let(:post_id) { '1' }
        let(:comment) { { content: 'This is a comment' } }
        run_test!
      end
    end
  end
end
