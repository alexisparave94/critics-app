class Game < ApplicationRecord
  belongs_to :parent, class_name: "Game",
                      optional: true
  has_many :games, foreign_key: "parent_id",
                   dependent: :nullify,
                   inverse_of: "parent"
end
