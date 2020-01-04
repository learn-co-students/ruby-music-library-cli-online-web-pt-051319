
require 'pry'

class Song 

extend Concerns::Findable 

	attr_accessor :name, :song, :artist, :genre

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name 
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
    
	end 

	def self.all 
		@@all 
	end 

	def self.destroy_all 
		@@all.clear 
	end 

	def save 
		@@all << self 
	end 

	def self.create(name)
	  Song.new(name).tap(&:save)
	end 

  def artist= (artist)
   @artist = artist
   artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self) 
  end 

  #def self.find_by_name(name)
    #self.all.detect {|song| song.name == name}
  #end 
  
  #def self.find_or_create_by_name(name)
    #self.find_by_name(name) || self.create(name)
  #end 
  
 def self.new_from_filename(filename)
  #binding.pry
   new = filename.split(/\.|\s-\s/).map(&:strip)
   song = Song.find_or_create_by_name(new[1])
   song.artist = Artist.find_or_create_by_name(new[0])
   song.genre = Genre.find_or_create_by_name(new[2])
   song
 end 
 
 def self.create_from_filename(filename)
   song = Song.new_from_filename(filename)
   song.save
 end 
 
end 