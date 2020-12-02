module EventHelper
  def all_categories(user)
    categories = Category.all.to_a
    categories.map do |v|
      [v.name, v.id]
    end
  end
end
