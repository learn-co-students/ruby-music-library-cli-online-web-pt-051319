 require_relative '../lib/concerns/findable'

class Artist
  
  extend Concerns::Findable
   attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []

  end
  
  def add_song(song)
  @songs << song unless @songs.include?(song)    #don't add song if it already exists
  song.artist = self unless song.artist == self    #don't assign the aritst if it already exists
  #keeps track of an artist's song
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    new_name = Artist.new(name)
    new_name.save
    new_name
  end
  
    def genres
      genres = self.songs.collect do |song|
        song.genre
      end
      genres.uniq
    end
end
 