module ApplicationHelper

  # calculates the average rating for a given set of reviews
  def avg_rating(reviews)
    total_stars = 0
    reviews.each do | review |
      total_stars += review.rating
    end
    avg = total_stars.to_f / reviews.count.to_f
    print("your avg is " + String(avg))
    return avg
    ret_str = ""
    # 5.times do | i |
    #   if avg > i
    #     ret_str = "<i class=\"glyphicon glyphicon-star\"></i>"
    #   else
    #     ret_str = "<i class=\"glyphicon glyphicon-star-empty\"></i>"
    #   end
    # end
    # return ret_str
  end

end
