#!/usr/bin/ruby
changes = `git diff master --name-only`.split("\n")
puts "All changes:\n  #{changes.join("\n  ")}"
changes = changes.select { |s| s =~ /^app/ }
puts "Changed app files:\n  #{changes.join("\n  ")}"

tests = changes.map { |s| s.gsub(/^app/, "spec").gsub(/.rb$/, "_spec.rb") }
tests = tests.select { |s| File.exists?(s) }
puts "Test files:\n  #{tests.join("\n  ")}"

cmd = "zeus rspec #{tests.join(" ")}"
puts "Running\n   #{cmd}"
exec cmd
