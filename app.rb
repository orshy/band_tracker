require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }


get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

post('/') do
  band_name = params.fetch("band_name")
  Band.create({ :name => band_name })
  venue_name = params.fetch("venue_name")
  Venue.create({ :name => venue_name })
  redirect('/')
end

get('/band/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @venues = Venue.all()
  erb(:band)
end
