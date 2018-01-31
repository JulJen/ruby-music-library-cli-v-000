require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    # binding.pry
    input = ''
      while input != 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip
    end
  end

  def list_songs
    Song.all.sort_by(&:name).each.with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by(&:name).uniq.each.with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by(&:name).uniq.each.with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      artist.songs.sort_by(&:name).each.with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      genre.songs.sort_by(&:name).each.with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.to_i
binding.pry
    list = Song.all.sort_by(&:name).each.with_index do |song, index|
    puts "Playing #{list[(input - 1)].name} by #{list[user - 1].artist.name}"
  end
    # list.collect { |song|
  #
  #   if input > 0 && input < list.count
  #     puts "Playing #{list[(input - 1)].name} by #{list[user - 1].artist.name}"
  #   end
  # end
#   puts "Which song number would you like to play?"
# user_input = gets.to_i
# playlist = Song.all.sort_by {|songs|songs.name}
# if user_input > 0 && user_input < playlist.count
#   puts "Playing #{playlist[user_input-1].name} by #{playlist[user_input-1].artist.name}"
# end
# end

end
