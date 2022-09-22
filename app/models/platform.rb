class Platform < ApplicationRecord
  # Assocaiations
  has_and_belongs_to_many :games

  # Validations
  validates :name, presence: true, uniqueness: true
end
