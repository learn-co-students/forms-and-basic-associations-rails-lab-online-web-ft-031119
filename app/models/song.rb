class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  validates :title, presence: true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(:name => name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(:name => name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_id=(i)
    self.genre = Genre.find_or_create_by(:id => i.to_i)
  end

  def genre_id
    if self.genre
      Genre.find(genre_id.to_i)
    else
      nil
    end
  end
end
