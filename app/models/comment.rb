class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :Text, presence: true

  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:CommentsCounter)
  end

  def author_name
    author.Name
  end
end
