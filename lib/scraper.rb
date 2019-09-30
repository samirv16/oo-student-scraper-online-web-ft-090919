require 'open-uri'
require 'pry'

class Scraper

    def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    student_cards = doc.css(".student-card a")
    student_cards.collect do |element|
      {:name => element.css(".student-name").text ,
        :location => element.css(".student-location").text,
        :profile_url => element.attr('href')
      }
    end
  end
  
  
  def self.scrape_profile_page(profile_url)
  end
    

end


# students = []
#     html = Nokogiri::HTML(open(index_url))
#     html.css(".student-card").collect do |student|
#       student_details = {
#       name: student.css(".student-name").text
#       location: student.css(".student-location").text
#       profile_url: "http://students.learn.co/" + sutudent.css("a").attribute("href")
#       # student.attr("href")
#       }
#       students << student_details
#     end
#     students