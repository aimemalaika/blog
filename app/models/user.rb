class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  validates :Name, presence: true, length: { maximum: 50 }
  validates :Photo, presence: true, length: { maximum: 255 }
  validates :Bio, presence: true, length: { maximum: 5000 }
  validates :PostsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
