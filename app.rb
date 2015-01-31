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

get('/band/delete/:id') do
  to_destroy_band = Band.find(params.fetch('id').to_i())
  to_destroy_band.destroy()
  redirect('/')
end

post('/band/:id') do
  band_id = params.fetch('id').to_i()
  @band = Band.find(band_id)
  venue_ids = params.fetch('venue_ids')
  @venues = Venue.find(venue_ids)
  @band.venues.push(@venues)
  url = "/band/" + band_id.to_s()
  redirect(url)
end

patch('/band/:id') do
  band_id = params.fetch("id")
  @band = Band.find(band_id.to_i())
  new_name = params.fetch("new_band_name")
  @band.update({ :name => new_name })
  url = "/band/" + band_id
  redirect(url)
end
