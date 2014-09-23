namespace :data do
  desc "load stats data into sqlite"
  task :load=> :environment do
    file = File.read('bigjson.txt')
    tags_data = JSON.parse(file)
    tags_data.each do |tag, data|
      Tag.create(name:tag, stats: data.to_json)
    end
  end
end
