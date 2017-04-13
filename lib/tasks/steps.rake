namespace :steps do
  desc "Scrape IMDb Movies Coming Soon and output CSV"
  task movies: :environment do
    # url = "http://www.imdb.com/movies-coming-soon/"
    # page = HTTParty.get(url)

    filename = Rails.root.join("lib", "imdb", "movies-coming-soon.html")
    page = open(filename)

    doc = Nokogiri::HTML(page)

    # First I find a CSS selector by right-clicking and Inspecting in Chrome
    #   In this case, I found elements class="nm-title-overview-widget-layout"
    #   that looks like they might each contain one movie.

    # Are there the right number?
    # ap doc.css(".nm-title-overview-widget-layout").count

    # Is the first element what we expect?
    # ap doc.css(".nm-title-overview-widget-layout").first

    # Let's drill deeper for a specific attribute. Right-click again in Chrome.
    # ap doc.css(".nm-title-overview-widget-layout").first.css("h4")

    # Get the actual text:
    # ap doc.css(".nm-title-overview-widget-layout").first.css("h4").text

    ap doc.css(".nm-title-overview-widget-layout").first.css("h4").text.strip
  end
end
