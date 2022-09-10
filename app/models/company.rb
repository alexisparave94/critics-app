class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, length: { in: 5..200 }, allow_nil: true
  validates :start_date, comparison: { less_than: Time.zone.now }, allow_nil: true
end
