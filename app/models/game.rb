class Game < ApplicationRecord
  # Associations
  belongs_to :parent, class_name: "Game",
                      optional: true
  has_many :expansions, class_name: "Game",
                        foreign_key: "parent_id",
                        dependent: :nullify,
                        inverse_of: "parent"

  has_many :involved_companies, dependent: :destroy
  has_many :companies, through: :involved_companies

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :platforms

  # Validations
  validates :name, presence: true
  validates :summary, length: { in: 10..100 }, allow_nil: true
  validates :release_date, comparison: { less_than: Time.zone.now }, allow_nil: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 },
                     allow_nil: true
  validates :parent, inclusion: { in: proc { Game.main_game } },
                     unless: proc { main_game? || category.nil? }
  validates :parent, absence: true, if: proc { main_game? }

  enum category: { main_game: 0, expansion: 1 }
end
