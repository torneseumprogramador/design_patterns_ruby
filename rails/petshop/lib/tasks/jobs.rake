namespace :jobs do
  desc "Run job cation cable"
  task :run => :environment do
    AovivoSubscribe.where("updated_at < ?", Time.zone.now - 5.hours).destroy_all
    AovivoSubscribe.all.each do |aovivo|
      AovivoChannel.broadcast_to(aovivo.usuario, {
        id: aovivo.id
      }.to_json)
    end
  end
end
