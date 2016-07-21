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

  def self.create     #create a class constructor
    new_song = self.new  #that initializes a song and saves it
      new_song.name = name  #we assign the new song to a name which gives out new song a name
        @@all<<new_song     #to the @all class variable
          new_song  #we return the new song
  end

  def self.new_by_name(lyric)
    new_song = self.new
      new_song.name = lyric
        new_song
  end

  def self.create_by_name(lyric)
    new_song = self.new
      new_song.name = lyric
        @@all << new_song
          new_song
  end

  def self.find_by_name(lyric)
    @@all.detect {|individual_songs|individual_songs.name == lyric}
  end

  def self.find_or_create_by_name(lyric)
    if self.find_by_name(lyric) == nil
      self.create_by_name(lyric)
    else
      return self.find_by_name(lyric)
    end
  end

  def self.alphabetical
    @@all.sort_by {|word| word.name} #sort through the @@all array and for each individual word
  end                                #return the reader value of each element.


  def self.new_from_filename(format)  #define a method which take in an argument of the format
    new_song = self.new     #create a new instance which will be our new song
      result = format.split(" - ")   #slpit the format at "-" and store the new string as a var.
        new_song.artist_name = result[0]  #the first element in the array format is assigned
          result[1].slice! ".mp3"         #as the artist name
            new_song.name = result[1] #the second element, the song name and format, we slice
    new_song                            #the element and get rid of ".mp3"
  end                                    #create a var for the new song string in a var referencing
                                        #the name reader.


  def self.create_from_filename(format)
    @@all<<self.new_from_filename(format)
  end


  def self.destroy_all
    self.all.clear      #the elements class variable @@all is cleared via the
  end                    #self.all method

end
