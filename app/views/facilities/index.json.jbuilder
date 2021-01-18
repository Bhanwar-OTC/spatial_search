json.array! @facilities do |facility|
  json.lat     facility.xy.x
  json.lng     facility.xy.y
  json.name    facility.name
  json.content FacilitiesController.render(partial: 'facilities/facility', locals: { facility: facility }, format: :html).squish
end