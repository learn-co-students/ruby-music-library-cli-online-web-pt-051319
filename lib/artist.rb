require_relative('./concerns/modules.rb')

class Artist

	extend Concerns::Findable

	attr_accessor :name, :songs

	attr_reader :genre

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		@@all << self
	end

	def add_song(song)
		song.artist || song.artist = self
		self.songs.include?(song) || self.songs << song
	end

	def genres
		self.songs.map{ |song| song.genre }.uniq
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all = []
	end
	
end