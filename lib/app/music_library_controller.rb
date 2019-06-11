require 'pry'
class MusicLibraryController

  def initialize(path='./db/mp3s')
    new_object = MusicImporter.new(path)
    new_object.import
  end
  
  def call
    reply = nil
    while reply != "exit"  
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      reply = gets.chomp
    end 
  end  

  def list_songs
    num = 1
    songs = []
    Song.all.each {|song| songs << song.name}
      songs.sort.uniq.each do |item|
        x = Song.find_by_name(item)
          puts "#{num}. #{x.artist.name} - #{item} - #{x.genre.name}"
            num += 1   
    end 
  end
  
  def list_artists
    num = 1
    artists = []
    Artist.all.each {|artist| artists << artist.name}
      artists.sort.uniq.each do |item|
        puts "#{num}. #{item}"
          num += 1
     end
  end  



end  