
require "pry"
require "song"
class Artist 
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self
  end 
  
  def self.all
    @@all 
  end
  
  def add_song(song)
    song.artist = self 
  end 
    
  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def self.find_or_create_by_name(name)
    temp_artist = self.all.find do |artist_oj|
      artist_oj.name  == name
    end
    if temp_artist 
      temp_artist
    else
      Artist.new(name)
    end 
   end
  
  def print_songs
    self.songs.each do |song| 
  puts song.name
 end 
 
    
  end
  
end




 
 # if temp_artist is an artist return temp_artist otherwise make a new artist.
 
