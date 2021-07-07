class Genre
 require_relative '../lib/concerns/findable'
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    
    @songs = []
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
    new_name = Genre.new(name)
    new_name.save
    new_name
  end
  
  def artists
      artists = self.songs.collect do |song|
        song.artist
      end
      artists.uniq
    end
  
  
end