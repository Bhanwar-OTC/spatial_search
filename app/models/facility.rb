class Facility < ApplicationRecord

  scope :within, -> (lat, long, meter) {
    where(%{
     ST_Distance(xy, 'POINT(%f %f)') < %d
    } % [lat, long, meter])
  }

  def self.my_import(file)
    require 'csv'

    facilities = []

    CSV.foreach(file, headers: true).with_index(1) do |row, ln|
      facilities << row.to_h
    end

    Facility.create! facilities
  end

end
