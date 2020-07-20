json.extract! schedule, :id, :ymd, :start, :end, :place, :addcomment, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
