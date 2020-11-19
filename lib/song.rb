require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = Song.new 
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|inst| inst.name}
  end

  def self.new_from_filename(file)
    file_data = file.split(/[.-]/).map{|section| section = section.strip}
    song = self.find_or_create_by_name(file_data[1])
    song.artist_name = file_data[0]
    song
  end

  def self.create_from_filename(file)
    file_data = file.split(/[.-]/).map{|section| section = section.strip}
    song = self.find_or_create_by_name(file_data[1])
    song.artist_name = file_data[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end
  
  def save
    self.class.all << self
  end

  

end
