module LinesHelper
  def short_station_listing(station, line)
    listing = station.name
    transfers = station.transfers_from(line)
    if (transfers.length > 0)
      transfers.each { |t| listing << " #{color_box(t)}"}
    end
    listing.html_safe
  end

  def color_box(line)
    # "<span style=\"background-color:#{line.color}; color:; text-align:center;\">&nbsp;&nbsp;&nbsp;&nbsp;</span>".html_safe
    "<span style=\"color: #{line.color};\">&#9632;</span>".html_safe
  end
end
