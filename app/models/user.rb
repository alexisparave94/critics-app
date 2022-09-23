class User < ApplicationRecord
  # Associatuions
  has_many :critics, dependent: :destroy

  # Validations
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
