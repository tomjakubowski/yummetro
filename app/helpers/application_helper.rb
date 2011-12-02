module ApplicationHelper
  def short_station_listing(station, opts={})
    opts = {
      :line_scope => nil,
      :short_name => false,
      :link_to => true
    }.merge(opts)

    display_name = opts[:short_name] ? station.short_name : station.name

    listing = opts[:link_to] ? link_to(display_name, station, :class => "camo") : display_name
    lines = opts[:line_scope] ? station.transfers_from(opts[:line_scope]) : station.lines_served

    colors = lines.map { |l| l.color }
    listing << " #{colors.map {|c| colored_dot(c)}.join('')}".html_safe if colors.length > 0
    listing.html_safe
  end

  def colored_dot(color)
    "<span style=\"color: #{color};\">&#9679;</span>".html_safe
  end
end
