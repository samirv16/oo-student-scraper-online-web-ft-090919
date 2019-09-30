require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_hash = []
    
    html = Nokogiri::HTML(open(index_url))
    
    html.css(".student-card").collect do |student|
      hash = {
        name: student.css("h4.sudent-name").text,
        location: student.css("p.student-location").text,
        profile_url: "http://students.learn.co/" + student.css("a").attribute("href")
      }
      student_hash << hash
    end
    student_hash
  end

  def self.scrape_profile_page(profile_url)
    

end

