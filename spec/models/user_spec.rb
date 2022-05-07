require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Model' do
    before(:example) do
      @user = User.new(Name: 'Michael Jackson', Photo: 'https://randomuser.me/api/portraits/lego/6.jpg',
                       Bio: 'I am a musician')
      @user.save
    end

    context 'User validation test' do
      it 'ensures Name presence' do
        @user.Name = ''
        expect(@user).to_not be_valid
      end

      it 'ensures PostsCounter greater than equal to 0' do
        expect(@user.PostsCounter).to be >= 0
      end
    end

    it 'User returns three most recent posts' do
      length = @user.recent_posts.length
      expect(length).to be <= 3
    end
  end
end
