require 'open-uri'
require 'pry'

class Scraper

    def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    student_cards = doc.css(".student-card a")
    student_cards.collect do |element|
      {
        :name => element.css(".student-name").text ,
        :location => element.css(".student-location").text,
        :profile_url => element.attr('href')
      }
    end
  end
  
  
  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    student_hash = {}
    social = doc.css(".vitals-container .social-icon-container a")
    
    social.each do |element|
     if element.attr("href").include?("twitter") 
       student_hash[:twitter] = element.attr("href")
     elsif element.attr("href").include?("linkedin") 
       student_hash[:linkedin] = element.attr("href")
     elsif element.attr("href").include?("github") 
       student_hash[:github] = element.attr("href")
     elsif element.attr("href").include?(".com/") 
       student_hash[:blog] = element.attr("href")
    end 
      student_hash[:profile_quote] = doc.css("vitals-container .vitals-text-container .profile_quote").text
      student_hash[:bio] = doc.css("")
  end
    

end

