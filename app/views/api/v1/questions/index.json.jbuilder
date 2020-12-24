json.array! @questions do |question|
  question_updated_at = question.updated_at.to_date

  json.id question.id
  json.title question.title
  json.updatedAt l(question_updated_at)
  json.userName question.user.name
end
