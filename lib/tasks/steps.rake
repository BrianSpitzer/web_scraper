namespace :steps do
  desc "Scrape IMDb Movies Coming Soon and output CSV"
  task movies: :environment do
    # url = "http://www.imdb.com/movies-coming-soon/"
    # page = HTTParty.get(url)

    filename = Rails.root.join("lib", "imdb", "movies-coming-soon.html")
    page = open(filename)

    doc = Nokogiri::HTML(page)

    movie_node = doc.css(".nm-title-overview-widget-layout").first

    ap movie_node.css("h4").text.strip

    # SelectorGadget is awesome for difficult to diagnose CSS selectors!
    ap movie_node.css(".outline+ .txt-block a").text.strip
    ap movie_node.css(".cert-runtime-genre span").text.strip
    ap movie_node.css("time").text.strip
    ap movie_node.css(".overview-top .outline").text.strip
  end
end
