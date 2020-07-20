class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.date :ymd
      t.time :start
      t.time :end
      t.string :place
      t.text :addcomment

      t.timestamps
    end
  end
end
