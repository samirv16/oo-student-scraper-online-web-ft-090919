require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    html = open(index_url)
    index = Nokogiri::HTML(html)
    index.css("div.student-card").each do |student|
      student_details = {
      :name = student.css("h4.student-name").text
      :location = student.css("p.student-location").text
      profile_path = student.css("a").attribute("href").value
      :profile_url = './fixtures/student-site/' + profile_path
      }
      students << student_details
      
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    

end
