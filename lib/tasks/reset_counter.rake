namespace :db do
desc 'Reset Count Cache'
task :reset_counter => :environment do
  puts "prepare reset counters"
Candidate.all.each do |candidate|

Candidate.reset_counters(candidate.id,:vote_logs)

    end
    puts "done!"
  end

end