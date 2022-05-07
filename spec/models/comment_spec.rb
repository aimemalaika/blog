require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:example) do
    @comments = Comment.new(Text: 'Content', author_id: 1, post_id: 1)
    @comments.save
  end

  context 'Presence of the text' do
    it 'ensures Text presence' do
      @comments.Text = ''
      expect(@comments).to_not be_valid
    end
  end
end
