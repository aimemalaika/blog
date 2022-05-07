class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id

  validates :Title, presence: true, length: { maximum: 250 }
  validates :Text, presence: true, length: { maximum: 5000 }
  validates :CommentsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def update_post_counter
    author.increment!(:PostsCounter)
  end

  def post_author
    author.Name
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
