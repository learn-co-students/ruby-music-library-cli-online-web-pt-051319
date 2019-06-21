class MusicLibraryController



	def initialize(path = "./db/mp3s")
		@new_importer = MusicImporter.new(path).tap( &:import )
		# self.call
	end

	def path
		@path
	end

	def path=(path)
		@path = path
	end

	def call
		puts "Welcome to your music library!"
    	puts "To list all of your songs, enter 'list songs'."
    	puts "To list all of the artists in your library, enter 'list artists'."
    	puts "To list all of the genres in your library, enter 'list genres'."
    	puts "To list all of the songs by a particular artist, enter 'list artist'."
    	puts "To list all of the songs of a particular genre, enter 'list genre'."
    	puts "To play a song, enter 'play song'."
    	puts "To quit, type 'exit'."
    	puts "What would you like to do?"


    	choice = nil

    	while choice != "exit" do

    		choice = gets.strip
       		case choice
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

	def list_songs
		library = @new_importer.files
		library.sort!{ |a, b| a.split(" - ")[1] <=> b.split(" - ")[1] }
		library.each_with_index{ |entry, i| puts "#{i + 1}. #{entry.split(".mp3")[0]}" }
	end

	def list_artists
		artists = Artist.all.map( &:name )
		# binding.pry
		artists.sort.each_with_index{ |artist, i| puts "#{i + 1}. #{artist}"}
	end

	def list_genres
		genres = Genre.all.map( &:name )
		genres.sort.each_with_index{ |genre, i| puts "#{i + 1}. #{genre}"}
	end

	def list_songs_by_artist
		puts "Please enter the name of an artist:"
		choice = gets.strip
		artist = Artist.find_by_name(choice)
		# binding.pry
		if(artist)
			artist.songs.sort{ |a, b| a.name <=> b.name }.each_with_index do |song, i|
				puts "#{i + 1}. #{song.name} - #{song.genre.name}"
			end
		end
	end

	def list_songs_by_genre
		puts "Please enter the name of a genre:"
		choice = gets.strip
		genre = Genre.find_by_name(choice)
		if(genre)
			genre.songs.sort{ |a, b| a.name <=> b.name }.each_with_index do |song, i|
				puts"#{i + 1}. #{song.artist.name} - #{song.name}"
			end
		end
	end

	def play_song
		puts "Which song number would you like to play?"
		choice = gets.strip
		library = @new_importer.library
		local = "out of if"
		if(choice.to_i > 0 && choice.to_i <= library.length)
			song_info = library.sort{ |a, b| a.split(" - ")[1] <=> b.split(" - ")[1] }[choice.to_i - 1]
			song_name = song_info.split(" - ")[1]
			artist_name = song_info.split(" - ")[0]
			puts "Playing #{song_name} by #{artist_name}"
		end
	end
end

# puts "Playing #{song_name} by #{artist_name}"