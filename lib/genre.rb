require_relative('./concerns/modules.rb')

class Genre

	extend Concerns::Findable
	extend Concerns::Destroyable
	include Concerns::Saveable

	attr_accessor :name

	attr_reader :songs

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
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
	
end