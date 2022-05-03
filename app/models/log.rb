class Log < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: :author_id

    def recent_logins
        logs.order(created_at: :desc).limit(5)
    end
end
