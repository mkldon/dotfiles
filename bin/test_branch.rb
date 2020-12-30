#!/usr/bin/ruby
all_changes = `git diff \`git merge-base master HEAD\` --name-only --cached`.split("\n")
puts "All changes:\n  #{all_changes.join("\n  ")}"

specs = []

# App file specs
specs += all_changes.select { |s| s =~ /^app/ }
                    .map { |s| s.gsub(/^app/, "spec").gsub(/.rb$/, "_spec.rb") }
                    .select { |s| File.exists?(s) }
# Changed specs files
specs += all_changes.select { |s| s =~ /^spec.*_spec.rb/ }
                    .select { |s| File.exists?(s) }

puts "Test files:\n  #{specs.join("\n  ")}"

cmd = "zeus rspec #{specs.join(" ")}"
puts "Running\n   #{cmd}"
exec cmd
