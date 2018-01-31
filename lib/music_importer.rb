require 'pry'

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    # Dir.glob(self.path + "/*.mp3").map { |file| file.gsub(path + "/", "")
    Dir.glob("#{path}/*").map{ |file| file.gsub("#{path}/", '')}

    # files = Dir.entries(@path)
    # files.delete_if { |file| file == "." || file == ".." }
  end

  def import
# binding.pry
    self.files.each { |file| Song.create_from_filename(file) }
    # Artist.all << self.create_from_filename(filename) unless Artist.all.include?(song.artist)
    # Artist.all << song.artist unless Artist.all.include(song.artist)
    # Song.create_from_filename
  end
end
