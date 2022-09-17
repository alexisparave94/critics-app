class InvolvedCompany < ApplicationRecord
  # Associations
  belongs_to :company, counter_cache: :games_count
  belongs_to :game

  # Validations
  validates :game, uniqueness: { scope: :company, message: "and company combination should be unique" }
  validates :developer, presence: { message: "and Publisher can't be blank" },
                        unless: proc { publisher? }
  validates :publisher, presence: { message: "and Developer can't be blank" },
                        unless: proc { developer? }
end
