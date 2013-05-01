class Tvshow
  include DataMapper::Resource

  property :id,          Serial, :key => true
  property :readable_id, String
  property :title,       String
   
  has n, :seasons
  has n, :episodes, :through => :seasons

end