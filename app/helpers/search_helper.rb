module SearchHelper
  def powered_by_yelp
    image_url = "http://media3.ak.yelpcdn.com/static/201012161285253944/img/developers/Powered_By_Yelp_Red.png"
    link_url = "http://www.yelp.com/"
    link_to image_tag(image_url, :alt => "Powered by Yelp!"), link_url, :target => "_blank"
  end
end
