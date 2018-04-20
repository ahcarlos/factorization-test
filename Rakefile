desc "test"
task :try do
  out = []
  IO.popen("git remote").each do |line|
    out.push(line.chomp)
  end
  
  unless ARGV.empty?
    unless out.include?('upstream')
      exec "git remote add upstream #{ARGV[1]}"
    end
  end
  
  exec 'git fetch upstream'
  exec 'git checkout master'
  exec 'git merge upstream/master'
end

task :add do 
  ARGV.each { |a| task a.to_sym do ; end } 
  puts ARGV[1].to_i + ARGV[2].to_i 
end 