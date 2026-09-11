#!/usr/bin/env ruby
# Refreshes _data/blog_posts.yml from the stuffaboutcode.com feed so the
# home page's "Latest from the blog" section stays current without a
# manual edit. Run via `bin/update-blog-posts.rb`, or automatically in CI
# (see .github/workflows/pages.yml) at build/deploy time and on a schedule.

require "rss"
require "open-uri"
require "yaml"

FEED_URL = "https://www.stuffaboutcode.com/feed.xml"
POST_COUNT = 4
TAGS_PER_POST = 2
OUTPUT_PATH = File.expand_path("../_data/blog_posts.yml", __dir__)

def fetch_feed(url)
  URI.open(url, "User-Agent" => "ohanlonweb.com-blog-sync/1.0") do |f|
    RSS::Parser.parse(f.read, false)
  end
end

def entry_url(entry)
  link = entry.respond_to?(:link) ? entry.link : nil
  return link.href if link.respond_to?(:href)

  link.to_s
end

def entry_date(entry)
  raw = entry.respond_to?(:published) ? entry.published : entry.date
  raw.content.to_s[0, 10]
end

def entry_tags(entry)
  return [] unless entry.respond_to?(:categories)

  entry.categories.map(&:term).compact.first(TAGS_PER_POST)
end

def build_posts(feed, count)
  feed.items.first(count).map do |entry|
    {
      "date" => entry_date(entry),
      "title" => entry.title.content.to_s.strip,
      "url" => entry_url(entry),
      "meta" => entry_tags(entry).map { |tag| "##{tag}" }.join(" "),
    }
  end
end

feed = fetch_feed(FEED_URL)
posts = build_posts(feed, POST_COUNT)

if posts.empty?
  warn "No posts parsed from #{FEED_URL} — leaving #{OUTPUT_PATH} untouched"
  exit 1
end

File.write(OUTPUT_PATH, posts.to_yaml)
puts "Wrote #{posts.size} posts from #{FEED_URL} to #{OUTPUT_PATH}"
