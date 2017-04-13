namespace :steps do
  desc "Scrape IMDb Movies Coming Soon and output CSV"
  task movies: :environment do
    # url = "http://www.imdb.com/movies-coming-soon/"
    # page = HTTParty.get(url)

    filename = Rails.root.join("lib", "imdb", "movies-coming-soon.html")
    page = open(filename)

    doc = Nokogiri::HTML(page)

    all_movie_nodes = doc.css(".nm-title-overview-widget-layout")

    all_movie_nodes.each do |one_movie_node|
      title = one_movie_node.css("h4").text.strip

      # SelectorGadget is awesome for difficult to diagnose CSS selectors!
      director = one_movie_node.css(".outline+ .txt-block a").text.strip
      genre = one_movie_node.css(".cert-runtime-genre span").text.strip
      runtime = one_movie_node.css("time").text.strip
      description = one_movie_node.css(".overview-top .outline").text.strip

      ap title
      ap genre
      ap runtime
      ap description
      ap "=" * 80
    end
  end
end
