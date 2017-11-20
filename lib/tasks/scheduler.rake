require 'open-uri'
require 'nokogiri'

desc 'This task is called by the Heroku scheduler add-on for parsing sources,'\
' getting news and filling db'
task parse_meduza: :environment do
  puts 'Parsing Meduza...'
  uri = 'https://meduza.io/rss/all'
  doc = Nokogiri::XML(open(uri))
  items = doc.xpath('//item')
  items.each do |item|
    begin
      news = News.new(title: item.children[0].content,
                      link: item.children[1].content,
                      description: item.children[4].content,
                      source: 'meduza')
      news.save
    rescue ActiveRecord::RecordNotUnique
      next
    end
  end
  puts 'Meduza parsing done.'
end
task parse_onliner: :environment do
  puts 'Parsing Onliner...'
  uri = 'https://people.onliner.by/feed'
  doc = Nokogiri::XML(open(uri))
  items = doc.xpath('//item')
  items.each do |item|
    begin
      news = News.new(title: item.children[1].children[0].content.gsub('&nbsp', ''),
                      link: item.children[3].content,
                      description: item.children[15].content.split('<p>')[2][0..-5],
                      source: 'onliner')
      news.save
    rescue ActiveRecord::RecordNotUnique
      next
    end
  end
  puts 'Onliner parsing done.'
end
task parse_tut: :environment do
  puts 'Parsing TUT...'
  uri = 'https://news.tut.by/rss/world.rss'
  doc = Nokogiri::XML(open(uri))
  items = doc.xpath('//item')
  items.first(30).each do |item|
    begin
      news = News.new(title: item.children[1].content,
                      link: item.children[3].content,
                      description: item.children[5].content,
                      source: 'tut')
      news.save
    rescue ActiveRecord::RecordNotUnique
      next
    end
  end
  puts 'TUT parsing done.'
end
task parse_lenta: :environment do
  puts 'Parsing Lenta...'
  uri = 'https://lenta.ru/rss'
  doc = Nokogiri::XML(open(uri))
  items = doc.xpath('//item')
  items.first(30).each do |item|
    begin
      news = News.new(title: item.children[3].content,
                      link: item.children[5].content,
                      description: item.children[7].content.gsub(/\n\s+/, ''),
                      source: 'lenta')
      news.save
    rescue ActiveRecord::RecordNotUnique
      next
    end
  end
  puts 'Lenta parsing done.'
end
task parse_bbc: :environment do
  puts 'Parsing BBC...'
  uri = 'http://feeds.bbci.co.uk/russian/rss.xml'
  doc = Nokogiri::XML(open(uri))
  items = doc.xpath('//item')
  items.first(30).each do |item|
    begin
      news = News.new(title: item.children[1].content,
                      link: item.children[5].content,
                      description: item.children[3].content,
                      source: 'bbc')
      news.save
    rescue ActiveRecord::RecordNotUnique
      next
    end
  end
  puts 'BBC parsing done.'
end
task parse_charter: :environment do
  puts 'Parsing Charter97...'
  uri = 'https://charter97.org/ru/rss/all/'
  doc = Nokogiri::XML(open(uri))
  items = doc.xpath('//item')
  items.first(30).each do |item|
    begin
      news = News.new(title: item.children[1].content,
                      link: item.children[3].content,
                      description: item.children[11].content,
                      source: 'charter')
      news.save
    rescue ActiveRecord::RecordNotUnique
      next
    end
  end
  puts 'Charter97 parsing done.'
end
