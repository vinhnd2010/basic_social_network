class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  default_scope -> {oder created_at: :desc}
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 150}
  validates :micropost_id, presence: true
end
