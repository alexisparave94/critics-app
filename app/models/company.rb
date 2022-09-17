class Company < ApplicationRecord
  # Associations
  has_many :involved_companies, dependent: :destroy
  has_many :games, through: :involved_companies
  
  # Validations
  validates :name, presence: true, uniqueness: true
  validates :description, length: { in: 5..200 }, allow_nil: true
  validates :start_date, comparison: { less_than: Time.zone.now }, allow_nil: true
end
