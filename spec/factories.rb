Factory.define :line do |line|
  line.name "Gold Line"
  line.color "#FDB913"
end

Factory.define :station do |station|
  station.name "Union Station"
  station.latitude 34.054761
  station.longitude -118.234254
end

Factory.define :business do |business|
  business.name "Moe's Tavern"
  business.distance 1000
  business.phone "(555) 764-8437"
  business.display_address ["555 Fake St.", "Springfield, XX 69420"]
  business.rating_image_url "http://static.yelp.com/foo/FIVESTARS.png"
  business.yelp_url "http://yelp.com/biz/moes-tavern-springfield"
  business.review_count 57
end