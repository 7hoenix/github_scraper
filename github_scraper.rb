#!/usr/bin/env ruby

require_relative './lib/finder'

repo_name = ARGV[0]
finder = GithubScraper::Finder.new(repo_name)
contacts = finder.all_contributors
puts contacts.join("\n")
