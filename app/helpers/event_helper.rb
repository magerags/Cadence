module EventHelper
  def all_categories(user)
    categories = user.categories
    categories.map do |v|
      [v.name, v.id]
    end
  end
end
