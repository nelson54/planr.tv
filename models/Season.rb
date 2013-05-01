class Season
  include DataMapper::Resource
  
  property :id,          Serial, :key => true
  property :number,      Integer   
  property :title,       String    
  property :final_count, Integer
  
  has n, :episodes

  belongs_to :tvshow
  
end