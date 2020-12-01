module EventHelper
  def all_categories(user)
    categories = Category.all.to_a
    uc = user.user_categories.to_a
    merge_categories = categories.concat(uc)
    merge_categories.map do |v|
      [v.name, [v.id, v.class.name].to_json]
    end
  end
end
