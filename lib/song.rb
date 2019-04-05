require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create 
  	Song.all << Song.new 
  	Song.all.last
  end

  def self.new_by_name(song_name)
  		song = Song.new
  		song.name = song_name
  		song
  end 

  def self.create_by_name(song_name)
  		Song.create 
  		Song.all.last.name = song_name
  		Song.all.last
  end 

  def self.find_by_name(song_name)
  	Song.all.find do |song|
  		song.name == song_name
  	end 
  end 

  def self.find_or_create_by_name(song_name)
  	if Song.find_by_name(song_name) == nil
  		Song.create_by_name(song_name) 
  	else Song.find_by_name(song_name)
  	end
  	# binding.pry
  end 

  def self.alphabetical
  	Song.all.sort_by do |song|
  		song.name 
  	end 
  end 

  def self.new_from_filename(song_name)
  	song = Song.new_by_name(song_name)
  	song.artist_name = song.name.partition(" - ").first
  	song.name = song.name.partition(" - ").last.partition(".mp3").first
  	song
  end 

  def self.create_from_filename(song_name)
  	song = Song.create_by_name(song_name)
  	Song.all.last.artist_name = song.name.partition(" - ").first
  	Song.all.last.name = song.name.partition(" - ").last.partition(".mp3").first
  	song
  end 

  def self.destroy_all
  	Song.all.clear 
  end 
end
