class Task < ApplicationRecord
    belongs_to :list
    validates :content,
              presence:true
    delegate :user_id, to: :list
end
