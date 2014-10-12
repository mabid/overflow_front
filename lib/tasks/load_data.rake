namespace :data do
  desc "load stats data into sqlite"
  task :load=> :environment do
    file = File.read('bigjson.txt')
    tags_data = JSON.parse(file)
    tags_data.each do |tag, data|
      Tag.create(name:tag, stats: data.to_json)
    end
  end

  task :load_emr=> :environment do
    hash = Hash.new
    file = File.readlines('final_out.json').each do |line|
      begin
        line.gsub!(/\\/, "")
        line = line[1..-4]
        if line.nil? 
          continue
        end
        puts line.length
        line.strip!
        puts line.length
        line = JSON.parse(line)
        hash[line["tag"]] ||= []
        hash[line["tag"]] << {date: line["date"], posts: line["count"]}
      rescue JSON::ParserError
        puts "failure is here:"
        puts line
      end
    end
    hash.each do |tag, data|
      TagEmr.create(name:tag, stats: data.to_json)
    end
  end
end
