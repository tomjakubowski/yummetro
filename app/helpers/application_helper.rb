module ApplicationHelper
  def short_station_listing(station, line=nil)
    listing = station.name
    if (line)
      lines = station.transfers_from(line)
    else
      lines = station.lines_served
    end
    colors = lines.map { |l| l.color }
    listing << " #{colors.map {|c| colored_dot(c)}.join('')}" if colors.length > 0
    listing.html_safe
  end

  def colored_dot(color)
    "<span style=\"color: #{color};\">&#9679;</span>".html_safe
  end
end
