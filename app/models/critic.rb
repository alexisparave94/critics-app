class Critic < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :criticable, polymorphic: true, counter_cache: true

  validates :title, presence: true
  validates :body, length: { in: 10..100 }
end
