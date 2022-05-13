class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :allowlisted_jwts, foreign_key: :author_id, dependent: :delete_all

  validates :Name, presence: true, length: { maximum: 50 }
  validates :Photo, presence: true, length: { maximum: 255 }
  validates :Bio, presence: true, length: { maximum: 5000 }
  validates :PostsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def on_jwt_dispatch(token, payload)
    super
    allowlisted_jwts.create!(jti: token, aud: payload['aud'], datetime: Time.now)
  end
end
