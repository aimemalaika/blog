class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :post_id, presence: true

  after_save :update_likes_counter

  def update_likes_counter
    post.increment!(:LikesCounter)
  end
end
