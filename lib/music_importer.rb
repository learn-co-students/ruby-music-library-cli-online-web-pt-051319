class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
  Dir["#{@path}/*.mp3"].map do |filepath|
    filepath.split("/").last
    end
  end

def import
files.each {|file| Song.create_from_filename(file)}
end

end
