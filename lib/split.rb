radicals = []

File.open('docs/index.md') do | fd |
  while row = fd.gets
    radicals << '' if row =~ /^# /
    radicals.last << row
  end
end

radicals.each_with_index do | r, idx |
  r.match(/^# (.+)部\n/)
  filename = '%03d_%s' % [idx, $1]

  File.open("docs/radicals/#{filename}.md", 'w') { | fd | fd.puts r }
end
