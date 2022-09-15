class Game < ApplicationRecord
  # Associations
  belongs_to :parent, class_name: "Game",
                      optional: true
  has_many :games, foreign_key: "parent_id",
                   dependent: :nullify,
                   inverse_of: "parent"

  # Validations

  validates :name, presence: true
  validates :summary, length: { in: 10..100 }, allow_nil: true
  validates :release_date, comparison: { less_than: Time.zone.now }, allow_nil: true
  validates :rating, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
