class Episode
  include DataMapper::Resource
  property :id,          Serial
  property :title,      String    # A varchar type string, for short strings
  property :aired,      DateTime  # A text block, for longer string data.
  property :length,     Integer   # A DateTime, for any date you might like.

  belongs_to :season, :key => true
  belongs_to :tvshow, :key => true
end