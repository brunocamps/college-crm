json.extract! lesson, :id, :user_id, :classroom_id, :course_id, :status, :start, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
