require_relative('./concerns/modules.rb')

class Artist

	extend Concerns::Findable
	extend Concerns::Destroyable
	include Concerns::Saveable

	attr_accessor :name, :songs

	attr_reader :genre

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def add_song(song)
		song.artist || song.artist = self
		self.songs.include?(song) || self.songs << song
	end

	def genres
		self.songs.map(&:genre).uniq
	end

	def self.all
		@@all
	end
	
end