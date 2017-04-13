namespace :steps do
  desc "Scrape IMDb Movies Coming Soon and output CSV"
  task movies: :environment do
    # url = "http://www.imdb.com/movies-coming-soon/"
    # page = HTTParty.get(url)

    filename = Rails.root.join("lib", "imdb", "movies-coming-soon.html")
    page = open(filename)

    doc = Nokogiri::HTML(page)

    # You can trigger programs manually from the command line
    #   and print output to the Terminal with rake tasks.
    
    ap "Hello world!"
  end
end
