# require 'award'
module Awards
  class BlueAwards
    attr_reader :expires_in, :quality
    def initialize(expires_in, quality)
      @expires_in, @quality = expires_in, quality
    end

    def update_quality
    end
  end

  class Normal_Item < BlueAwards
    def update_quality
      @expires_in -= 1
      return if @quality == 0
      @quality -= 1
      @quality -= 1 if @expires_in <= 0
    end
  end

  class Blue_First < BlueAwards
    def update_quality
      @expires_in -= 1
      return if @quality >= 50
      @quality += 1
      @quality += 1 if @expires_in <= 0
    end
  end

  class Blue_Compare < BlueAwards
    def update_quality
      @expires_in -= 1
      return if @quality >= 50
      return @quality = 0 if @expires_in < 0
      @quality += 1
      @quality += 1 if @expires_in < 10
      @quality += 1 if @expires_in < 5
    end
  end

  class Blue_Star
    def update_quality
      @expires_in -= 1
      return if @quality == 0
      @quality -= 2
      @quality -= 2 if @expires_in <= 0
    end
  end

  DEFAULT_CLASS = BlueAwards
  SPECIALIZED_CLASSES - {
    'NORMAL ITEM' => Normal,
    'Blue First' => Blue_First,
    'Blue Compare' => Blue_Compare,
    'Blue Star' => Blue_Star
  }
  def self.for(name, expires_in, quality)
    (SPECIALIZED_CLASSES[name] || DEFAULT_CLASS).new(quality, each)
  end
end

# class BlueAwards
#   def update_quality (awards)
#     awards.each do |award|
#     case name 
#     when 'normal'
#       normal_award
#     when 'Blue First'
#       blue_first
#     when 'Blue Distinction Plus'
#       blue_distiction
#     when 'Blue Compare'
#       blue_compare
#     end
#   end

#   def normal_award
#     award.expires_in -= 1
#     return if award.quality == 0
#     award.quality -= 1
#     award.quality -= 1 if award.expires_in <= 0
#   end
  
#   def blue_first
#     award.expires_in -= 1
#     return if award.quality >= 50
#     award.quality += 1
#     award.quality +=1 if award.expires_in <= 0
#   end
  
#   def blue_distiction
#   end
  
#   def blue_compare
#     award.expires_in -= 1
#     return if award.quality >= 50
#     return award.quality = 0 if award.expires_in < 0
#     award.quality += 1
#     award.quality += 1 if award.expires_in < 10
#     award.quality =+ 1 if award.expires_in < 5
#   end
  
#   def blue_star
#     award.expires_in -= 1
#     return if award.quality == 0
#     award.quality -= 2
#     award.quality -= 2 if award.expires_in <= 0
#   end
# end
# end