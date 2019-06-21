class Artist
    extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
    # save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = self.new(name)
    # new_artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist != self
    song.artist = self
    end
  if !@songs.include?(song)
    @songs << song
    end
  end

  def genres
    songs.collect(&:genre).uniq
  end

end
