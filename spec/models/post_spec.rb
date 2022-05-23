require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:example) do
    @posts = Post.new(Title: 'Title', Text: 'Content', author_id: 1)
    @posts.save
  end

  context 'Presence of the title and text' do
    it 'ensures Title presence' do
      @posts.Title = ''
      expect(@posts).to_not be_valid
    end

    it 'ensures Text presence' do
      @posts.Text = ''
      expect(@posts).to_not be_valid
    end
  end
end
