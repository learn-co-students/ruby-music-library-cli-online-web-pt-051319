class Song

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all?
  end

  def self.destroy_all
    @@all = []
  ends

  def save
    @@all << self
  end

  def self.create(name)
    initialize(name)
    save
    self.all
  end
end
