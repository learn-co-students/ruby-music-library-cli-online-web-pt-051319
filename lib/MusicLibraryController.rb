require 'pry'

class MusicLibraryController 
  
 def initialize(path = "./db/mp3s") 
   MusicImporter.new(path).import 
 end 
  
 def call
    input = ""
    loop do
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

       if input == "exit"
        break
      end

       if input == "list songs"
        self.list_songs
        break
      end

       if input == "list artists"
        self.list_artists
        break
      end

       if input == "list genres"
        self.list_genres
        break
      end

       if input == "list artist"
        self.list_songs_by_artist
        break
      end

       if input == "list genre"
        self.list_songs_by_genre
        break
      end

       if input == "play song"
        self.play_song
        break
      end
    end
  end

   def list_songs
    songs = []
    
    Song.all.each { |song| songs << song }
    songs_sorted = songs.sort { |e,f| e.name <=> f.name}.uniq
    songs_sorted.each.with_index(1) { |song,i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
  end

   def list_artists
    artists_name = []
    
    Artist.all.each { |artist| artists_name << artist.name}.uniq
    artists_name.sort.each.with_index(1) { |name,i|
      puts "#{i}. #{name}"
    }
  end

    def list_genres
    genres_name = []
    
    Genre.all.each { |genre| genres_name << genre.name}
    genres_name.sort.each.with_index(1) { |name,i|
      puts "#{i}. #{name}"
    }
  end

   def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    songs = Song.all.select { |song| song.artist.name == input}
    songs_sorted = songs.sort { |e,f| e.name <=> f.name}.uniq
    songs_sorted.each.with_index(1) { |song,i|
      puts "#{i}. #{song.name} - #{song.genre.name}"
    }
  end

   def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
  
    songs = Song.all.select { |song| song.genre.name == input}
    songs_sorted = songs.sort { |e,f| e.name <=> f.name}.uniq
    songs_sorted.each.with_index(1) { |song,i|
      puts "#{i}. #{song.artist.name} - #{song.name}"
    }
  end

   def play_song
    input = ""
    puts "Which song number would you like to play?"
      input = gets.strip.to_i
      songs_sorted = Song.all.sort { |e,f| e.name <=> f.name}.uniq
      if input <= songs_sorted.size && input != 0
        puts "Playing #{songs_sorted[input- 1].name} by #{songs_sorted[input - 1].artist.name}"
      end
  end

 end