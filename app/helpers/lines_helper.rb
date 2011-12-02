module LinesHelper
  def short_station_listing(station, line)
    listing = station.name
    transfers = station.transfers_from(line)
    listing << " #{transfers.map {|t| color_indicator(t)}.join('')}" if transfers.length > 0
    listing.html_safe
  end

  def color_indicator(line)
    "<span style=\"color: #{line.color};\">&#9679;</span>".html_safe
  end
end
