class Song

	attr_accessor :name

	attr_reader :artist, :genre

	def initialize(name, artist = nil, genre = nil)
		@name = name
		self.artist = artist
		self.genre = genre
	end

	def save
		@@all << self
	end

	def artist=(artist)
		@artist = artist
		artist && artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre && genre.add_song(self)
	end

	def self.all
		@@all
	end	

	def self.destroy_all
		@@all = []
	end

	def self.create(name)
		Song.new(name).tap{ |song| song.save }
	end

	def self.find_by_name(name)
		self.all.detect{ |song| song.name == name}
	end

	def self.find_or_create_by_name(name)
		self.find_by_name(name) || self.create(name)
	end

	def self.new_from_filename(filename)
		file_info = filename.split(" - ")
		artist = Artist.find_or_create_by_name(file_info[0])
		genre = Genre.find_or_create_by_name(file_info[2].split(".mp3")[0])
		Song.new(file_info[1], artist, genre)
	end

	def self.create_from_filename(filename)
		self.new_from_filename(filename).tap{ |song| song.save }
	end

end