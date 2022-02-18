# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'rest-client'
rest_client = RestClient.get 'https://api.themoviedb.org/3/movie/top_rated?api_key=d46ec40cc5f58addb3d983ff2f9cd951'
rest_client_array = JSON.parse(rest_client)["results"]

Movie.destroy_all

puts 'loading'

1.times do
  rest_client_array.each do |movie|
    puts "creating #{movie["original_title"]}"
    Movie.create!(
      title: movie["original_title"],
      overview: movie["overview"],
      poster_url: movie["poster_path"],
      rating: movie["vote_average"]
    )
  end
end

puts 'Finished'
