class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    execute %q(CREATE EXTENSION IF NOT EXISTS "postgis"),
            %q(DROP EXTENSION IF EXISTS "postgis")

    create_table :facilities do |t|
      t.string :name
      t.string :facility_type
      t.string :st_name
      t.string :st_type
      t.string :contact_name
      t.string :language

      t.st_point :xy, geographic: true

      t.timestamps
    end

    add_index :facilities, :xy, using: :gist
  end
end
