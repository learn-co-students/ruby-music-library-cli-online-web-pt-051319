require_relative('./concerns/modules.rb')

class Genre

	extend Concerns::Findable

	attr_accessor :name

	attr_reader :songs

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		self.class.all << self
	end

	def add_song(song)
		song.genre || song.genre = self
		self.songs.include?(song) || self.songs << song
	end

	def artists
		songs.map{ |song| song.artist }.uniq
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all = []
	end
	
end