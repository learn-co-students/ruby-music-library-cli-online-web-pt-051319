class MusicLibraryController
  
  def initialize(path = './db/mp3s')
   MusicImporter.new(path).import 
  end
  
  def call
        input = nil
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
        input = gets.chomp
        
    case input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
    end 
  end
      
      
   end
   
   # "1. Thundercat - For Love I Come -dance"
   def list_songs
     sorted_songs = Song.all.sort_by(&:name).uniq     # Song.all.sort_by {|song| song.name}
     sorted_songs.each_with_index {|s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
   end
   
   
   
   def list_artists
     sorted_artist = Artist.all.sort_by(&:name).uniq    
     sorted_artist.each_with_index {|a, i| puts "#{i + 1}. #{a.name}"}
    end

   def list_genres
     sorted_genre = Genre.all.sort_by(&:name).uniq    
     sorted_genre.each_with_index {|g, i| puts "#{i + 1}. #{g.name}"}
   end
   
   def list_songs_by_artist
     puts "Please enter the name of an artist:"
     input = gets.chomp
     if Artist.find_by_name(input)
       sorted_songs = Artist.find_by_name(input).songs.sort_by(&:name).uniq 
       sorted_songs.each_with_index {|s, i| puts "#{i + 1}. #{s.name} - #{s.genre.name}"}
     end
   end
   
   #("1. Real Estate - It's Real")
   def list_songs_by_genre
      puts "Please enter the name of a genre:"
     input = gets.chomp
     if Genre.find_by_name(input)
       sorted_genre = Genre.find_by_name(input).songs.sort_by(&:name).uniq 
       sorted_genre.each_with_index {|g, i| puts "#{i + 1}. #{g.artist.name} - #{g.name}"}
     end
    end
    
    def play_song
      puts "Which song number would you like to play?"
      input = gets.to_i
      if (1..Song.all.length).include?(input)
        song_title = Song.all.sort_by(&:name).uniq[input - 1]
        puts "Playing #{song_title.name} by #{song_title.artist.name}" if song_title
      end
    end
  end

    
    
    
    
    

  
  
  
  