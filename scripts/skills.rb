folder = '../_posts'
files = Dir.entries(folder)
posts = files.delete_if { |f| !f.include?('.markdown') }

categories = {}

posts.each do |post|
  path = folder + '/' + post
  File.readlines(path).each do |l|
    if l.include?('categories')
      c = l.split(' ')
      c.delete('categories:')
      c.each { |t| categories[t] = categories[t].to_i + 1 }
    end
  end
end

puts categories
