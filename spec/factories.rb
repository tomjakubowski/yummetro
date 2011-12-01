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
end