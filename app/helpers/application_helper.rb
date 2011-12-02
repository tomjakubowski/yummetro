module ApplicationHelper
  def short_station_listing(station, line=nil)
    listing = link_to(station.name, station, :class => "camo")
    lines = line ? station.transfers_from(line) : station.lines_served

    colors = lines.map { |l| l.color }
    listing << " #{colors.map {|c| colored_dot(c)}.join('')}".html_safe if colors.length > 0
    listing.html_safe
  end

  def colored_dot(color)
    "<span style=\"color: #{color};\">&#9679;</span>".html_safe
  end
end
