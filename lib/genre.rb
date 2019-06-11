class Genre
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
    Genre.new(name).save
    self
  end

  def artists
    all_artists = []
    @songs.each do |song|
      if !all_artists.include?(song.artist)   
        all_artists << song.artist
      end
    end
    all_artists
  end  

end  