# coding: utf-8
# This script manages the migration of the w3c.it site
# It manages news, prs, and talks
#
# It starts from the archive views, where we get the list of all
# published data.  We parse vevents with Nokogiri and then we read
# the linked content, which we transform into a Jekyll post.

require 'nokogiri'
require 'date'

# where the dump of the website is located
DUMP_DIRNAME = "/Users/adolfo/Google Drive/ICT4G Projects/Education/w3c/website/_www.w3c.it"
# where the archive views are
BASE = File.join(DUMP_DIRNAME, "/TR/3377/archivio")

#
# GENERAL PURPOSE FUNCTIONS
# 

# transform a pair (2014, 10 NOV) into a proper data
def to_date year, day_month
  day_s = /[0-9]+/.match(day_month)[0]
  month_s = /[A-Z]+/.match(day_month)[0]

  month = 1 + ["GEN", "FEB", "MAR", "APR", "MAG", "GIU", "LUG", "AGO", "SET", "OTT", "NOV", "DIC"].index(month_s)
  Date.new(year.to_i, month, day_s.to_i)
end


#
# PARSE NEWS AND EVENTS
#

# news have only an interesting part, namely what is comprised in w3c_content_body
def parse_news file, title, date, categories
  doc = File.open(file) { |f| Nokogiri::HTML(f) }
  body = doc.css(".w3c_content_body").children.to_xhtml(indent: 2, encoding:'US-ASCII')

  <<EOS
---
title: "#{title.gsub('"', '\\"')}"
date: #{date}
categories: #{categories}
---
#{body.strip}
EOS
end

# <li class="vevent">
#   <p class="date">
#     <span class="dtyear">2003</span>
#     <span class="dtstart single">31 DIC</span>
#   </p>
#    
#   <div class="info-wrap">
#     <p class="summary">
#       <a href="/it/1162/tim-berners-lee-sta-per-ricevere-il-titolo-di-cavaliere-dalla-regina-elisabetta.html">Tim Berners-Lee Sta per Ricevere il Titolo di Cavaliere dalla Regina Elisabetta</a>
#     </p>
#     <p class="location"></p>
#   </div>
# </li>

# the different views (one per year, apparently). Notice the * in the
# filename
#
# [file to read, destination folder, categories to be added to the post]
VIEWS=[["archive\:T\,months_grouper\:\,selected_year\:20*,page_type:news+W3C", "news/w3c/_posts", ""],
       ["archive:T,months_grouper:,selected_year:20*,page_type:news+local", "news/w3cit/_posts", ""],
       ["archive:T,months_grouper:,selected_year:20*,page_type:events", "events/_posts", "news eventi"]]

def migrate_news
  VIEWS.each do |group|
    files = Dir.glob(BASE + "/" + group[0])
    files.each do |arg|
      puts "Reading #{arg}..."
      doc = File.open(arg) { |f| Nokogiri::HTML(f) }

      puts "Extracting vevents..."
      events = doc.css("li.vevent")
      events.each do |event|
        year = event.css(".dtyear").text
        day_month = event.css(".dtstart").text

        a = event.css("a")[0]
        summary = a.children.to_html(encoding:'US-ASCII')
        link = a["href"]

        puts "#{year}, #{day_month}, #{summary} #{link} #{File.basename(link)}"
        # puts "#{to_date year, day_month}"

        date = to_date(year, day_month)
        string = parse_news DUMP_DIRNAME + "/" + link, summary, date, group[2]

        f = File.open("/Users/adolfo/Documents/Sites/w3c/#{group[1]}/#{date.strftime("%Y-%m-%d")}-#{File.basename(link)}", "w")
        f.write(string)
        f.close
      end
    end
  end
end

#
# PARSE PRESS RELEASES
#

# news have only an interesting part, namely what is comprised in
# w3c_content_body
def parse_press_release file, title, date, categories
  doc = File.open(file) { |f| Nokogiri::HTML(f) }
  # body = doc.css(".w3c_content_body").children.to_xhtml(indent: 2, encoding:'US-ASCII')

  <<EOS
---
title: "#{title.gsub('"', '\\"')}"
date: #{date}
alias: #{file.gsub(DUMP_DIRNAME, "")}
categories: #{categories}
---
#{doc.to_html.strip}
EOS
end

def migrate_press_releases
  files = Dir.glob(BASE + "/" + "archive:T,months_grouper:,selected_year:20*,page_type:pr")
  files.each do |arg|
    puts "Reading #{arg}..."
    doc = File.open(arg) { |f| Nokogiri::HTML(f) }

    puts "Extracting vevents..."
    events = doc.css("li.vevent")
    events.each do |event|
      year = event.css(".dtyear").text
      day_month = event.css(".dtstart").text

      a = event.css("a")[0]
      summary = a.children.to_html(encoding:'US-ASCII')
      link = a["href"]

      puts "#{year}, #{day_month}, #{summary} #{link} #{File.basename(link)}"
      # puts "#{to_date year, day_month}"

      date = to_date(year, day_month)
      string = parse_news DUMP_DIRNAME + "/" + link, summary, date, group[2]
      
      f = File.open("/Users/adolfo/Documents/Sites/w3c/comunicati-stampa-new/#{date.strftime("%Y-%m-%d")}-#{File.basename(link)}", "w")
      f.write(string)
      f.close
    end
  end
end

#
# Talks are a different beast
#

# - title: "Linked Open Data: an introduction"
#   author: Oreste Signore
#   url: /talks/2015/lodjch/
#   event: "Workshop Linked Open Data &amp; the Jewish Cultural Heritage"
#   date: 2015-01-20
#   location: Roma
#   event_url: "http://www.cdec.it/home2_2.asp?idtesto=1529&idtesto1=1529"

def to_talk title, author, url, event, date, location, event_url
  <<EOS
- title: "#{title.strip.gsub('"', '\\"')}"
  author: #{author.strip.gsub(/^by[ ]+/, "")}
  url: #{url.strip}
  event: "#{event.strip.gsub('"', '\\"')}"
  date: #{date}
  location: #{location.strip}
  event_url: #{event_url.strip}

EOS
end

def migrate_talks
  talks = ""

  files = Dir.glob(BASE + "/" + "archive:T,months_grouper:,selected_year:20*,page_type:talks")
  files.each do |arg|
    puts "Reading #{arg}..."
    doc = File.open(arg) { |f| Nokogiri::HTML(f) }

    puts "Extracting vevents..."
    events = doc.css("li.vevent")
    events.each do |event|
      year = event.css(".dtyear").text
      day_month = event.css(".dtstart").text

      author = event.css("p.source").children.to_html( encoding:'US-ASCII' )

      summary = event.css("p.summary")
      if summary.css("a").empty? then
        title = summary.children.to_html( encoding:'US-ASCII' )
        url = ""
      else
        title = summary.css("a").children.to_html( encoding:'US-ASCII' )
        url = summary.css("a")[0]["href"]
      end

      conference = event.css("p.eventtitle")
      if conference.css("a").empty? then
        event_title = conference.children.to_html( encoding:'US-ASCII' )
        event_url = ""
      else
        event_title = conference.css("a").children.to_html( encoding:'US-ASCII' )
        event_url = conference.css("a")[0]["href"]
      end

      location = event.css("p.location").children.to_html( encoding:'US-ASCII' )
      date = to_date(year, day_month)
      talks << to_talk(title, author, url, event_title, date, location, event_url)
    end
  end

  f = File.open("/Users/adolfo/Documents/Sites/w3c/_data/talks.yml", "w")
  f.write(talks)
  puts "talks written to _data/talks.yml"
end

