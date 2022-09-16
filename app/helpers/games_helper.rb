module GamesHelper
  def self.format_categories(categories)
    categories.map do |cat|
      [cat.split("_").map(&:capitalize).join(" "), cat]
    end
  end
end
