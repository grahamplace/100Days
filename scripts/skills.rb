folder = '../_posts'
files = Dir.entries(folder)
posts = files.delete_if { |f| !f.include?('.markdown') }

categories = {}
post_count = 0

posts.each do |post|
  path = folder + '/' + post
  File.readlines(path).each do |l|
    if l.include?('categories')
      c = l.split(' ')
      c.delete('categories:')
      c.each { |t| categories[t] = categories[t].to_i + 1 }
      post_count+=1
      break
    end
  end
end

file_str = ''
sorted = categories.sort

m = sorted.to_h.values.max

sorted.each do |c, i|
  num = (10 * (i.to_f / m.to_f)).to_i
  file_str += "-   id: #{c}"
  file_str += "\n    descr: #{c}"
  file_str += "\n    xp: #{num.to_s}\n"
end

File.write('../_data/skills.yml', file_str)
