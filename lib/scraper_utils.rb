def fetch_nested_value(data, key)
  if data[key].is_a?(Hash)
    fetch_nested_value(data[key], key)
  elsif data[key].is_a?(Array)
    data[key].map { |entry| fetch_nested_value(entry, key) }
  else
    data[key]
  end
end
