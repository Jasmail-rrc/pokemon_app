require "httparty"

Pokemon.destroy_all
Type.destroy_all

url = "https://pokeapi.co/api/v2/pokemon?limit=200"
response = HTTParty.get(url)

response["results"].each do |pokemon_data|
  details = HTTParty.get(pokemon_data["url"])

  type_name = details["types"][0]["type"]["name"]
  type = Type.find_or_create_by(name: type_name)

  Pokemon.create(
    name: details["name"],
    height: details["height"],
    weight: details["weight"],
    image_url: details["sprites"]["front_default"],
    type: type
  )
end

puts "Done!"