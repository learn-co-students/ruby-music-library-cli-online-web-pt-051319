class Genre 
  
  attr_accessor :name, :songs
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def artists 
    songs.map(&:artist).uniq
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
  
  def self.create(genre)
    self.new(genre).tap {|genre| genre.save}
  end
  
  
  
end