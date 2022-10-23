json.errors @company do |key, company|
  json.error_info "#{key} #{company[0]}"
  json.object "Company"
end