class FacilitySerializer < ActiveModel::Serializer
  attributes :type, :properties, :geometry

  def type
    return "Feature"
  end

  def properties
    return {
      id: object.id,
      name: object.name,
      facility_type: object.facility_type,
      st_name: object.st_name,
      st_type: object.st_type,
      contact_name: object.contact_name,
      language: object.language,
      

    }
  end

  def geometry
    return {
      type: "Point",
      coordinates: [
        object.xy.x,
        object.xy.y
      ]
    }
  end

end
