class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :Text, presence: true

  after_save :update_comments_counter_add
  after_destroy :update_comments_counter_delete

  def update_comments_counter_add
    post.increment!(:CommentsCounter)
  end

  def update_comments_counter_delete
    post.decrement!(:CommentsCounter)
  end

  def author_name
    author.Name
  end
end
