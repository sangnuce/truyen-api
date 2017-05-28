class Story < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true

  class << self
    def crawl_web_truyen url, category_id
      page = Nokogiri::HTML open(url)
      doc = page.css(".list-content")
      doc.css(".post-title a").map{|a| a["href"]}.compact.uniq.map do |href|
        page_content = Nokogiri::HTML open(href)
        title = page_content.css(".chapter-header h1 a").text
        content = page_content.css("#content p").text
        Story.create! category_id: category_id, title: title, content: content
      end
    end

    def crawl_doctruyencotich url, category_id
      page = Nokogiri::HTML open(url)
      doc = page.css(".archive")
      doc.css(".baiviet a").map{|a| a["href"]}.compact.uniq.map do |href|
        page_content = Nokogiri::HTML open(href)
        title = page_content.css(".single h1").text
        page_content.css(".single h1").remove
        page_content.css(".single .breakdum").remove
        page_content.css(".single .dv").remove
        content = page_content.text
        Story.create! category_id: category_id, title: title, content: content
      end
    end
  end
end
