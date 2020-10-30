require 'award'

class BlueAwards
  def update_quality (awards)
    awards.each do |award|
    case name 
    when 'normal'
      normal_award
    when 'Blue First'
      blue_first
    when 'Blue Distinction Plus'
      blue_distiction
    when 'Blue Compare'
      blue_compare
    end
  end
#       if award.name != 'Blue First' && award.name != 'Blue Compare'
#         if award.quality > 0
#         if award.name != 'Blue Distinction Plus'
#           award.quality -= 1
#         end
#       end
#     else
#       if award.quality < 50
#         award.quality += 1
#         if award.name == 'Blue Compare'
#           if award.expires_in < 11
#             if award.quality < 50
#               award.quality += 1
#             end
#           end
#           if award.expires_in < 6
#             if award.quality < 50
#               award.quality += 1
#             end
#           end
#         end
#       end
#     end
#     if award.name != 'Blue Distinction Plus'
#       award.expires_in -= 1
#     end
#     if award.expires_in < 0
#       if award.name != 'Blue First'
#         if award.name != 'Blue Compare'
#           if award.quality > 0
#             if award.name != 'Blue Distinction Plus'
#               award.quality -= 1
#             end
#           end
#         else
#           award.quality = award.quality - award.quality
#         end
#       else
#         if award.quality < 50
#           award.quality += 1
#         end
#       end
#     end
#   end
# end
  def normal_award
    award.expires_in -= 1
    return if award.quality == 0
    award.quality -= 1
    award.quality -= 1 if award.expires_in <= 0
  end

  def blue_first
    award.expires_in -= 1
    return if award.quality >= 50
    award.quality += 1
    award.quality +=1 if award.expires_in <= 0
  end

  def blue_distiction
  end

  def blue_compare
    award.expires_in -= 1
    return if award.quality >= 50
    return award.quality = 0 if award.expires_in < 0
    award.quality += 1
    award.quality += 1 if award.expires_in < 10
    award.quality =+ 1 if award.expires_in < 5
  end

  def blue_star
    award.expires_in -= 1
    return if award.quality == 0
    award.quality -= 2
    award.quality -= 2 if award.expires_in <= 0
end