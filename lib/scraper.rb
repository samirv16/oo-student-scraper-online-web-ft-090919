require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    html = Nokogiri::HTML(open(index_url))
    html.css(".student-card").collect do |student|
      student_details = {
      name: student.css(".student-name").text
      location: student.css(".student-location").text
      profile_url: "http://students.learn.co/" + attribute.
      # student.attr("href")
      }
      students << student_details
    end
    students
  end

  def self.scrape_profile_page(profile_url)
  end
    

end
