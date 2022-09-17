module GamesHelper
  def self.format_categories(categories)
    categories.map do |cat|
      [cat.split("_").map(&:capitalize).join(" "), cat]
    end
  end

  def self.filter_involved_companies(involved_companies, option)
    option == "developer" ? involved_companies.select(&:developer?) : involved_companies.select(&:publisher?)
  end
end
