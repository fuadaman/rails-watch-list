# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# List.create(name: "Hollywood movies")
# List.create(name: "Brazilian movies")

require "json"
require "open-uri"

puts "Cleaning database..."
Movie.destroy_all

# TMDB image base URL
base_poster_url = "https://image.tmdb.org/t/p/original"

puts "Connecting to the API..."
# We try page 1 first to test
url = "https://tmdb.lewagon.com/movie/top_rated"

begin
  # 1. Open the URL
  data_serialized = URI.open(url).read
  # 2. Parse the JSON
  data = JSON.parse(data_serialized)
  # 3. Get the array of movies
  movies = data["results"]

  puts "Found #{movies.count} movies on this page."

  movies.each do |movie|
    puts "Creating #{movie['title']}..."
    Movie.create!(
      title: movie["title"],
      overview: movie["overview"],
      poster_url: "#{base_poster_url}#{movie['poster_path']}",
      rating: movie["vote_average"]
    )
  end
rescue StandardError => e
  puts "ERROR: #{e.message}"
end

puts "Finished! You now have #{Movie.count} movies in your database."
