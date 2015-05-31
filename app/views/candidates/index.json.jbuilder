json.array!(@candidates) do |candidate|
  json.extract! candidate, :id, :name, :email, :html_score, :css_score, :javascript_score, :python_score, :django_score, :ios_score, :android_score
  json.url candidate_url(candidate, format: :json)
end
