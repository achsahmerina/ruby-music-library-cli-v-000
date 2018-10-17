class MusicLibraryController

  attr_accessor :musicimporter

  def initialize(path = "./db/mp3s")
    @musicimporter = MusicImporter.new(path)
    @musicimporter.import
  end

  def call
    input = ""
    while input != "exit"
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
    Song.all.sort_by{|song| song.name}.uniq.each.with_index(1) do |song, name|
      puts "#{name}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by{|artist| artist.name}.uniq.each.with_index(1) do |artist, name|
      puts "#{name}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by{|genre| genre.name}.uniq.each.with_index(1) do |genre, name|
      puts "#{name}. #{genre.name}"
    end
  end
end
