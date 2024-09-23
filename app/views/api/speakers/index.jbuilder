@speakers.each do |speaker|
  json.set! speaker.user_id do
    json.extract! speaker, :twitter, :github, :biography, :public_email, :organisation, :last_name, :first_name, :name
    json.picture rails_blob_url(speaker.picture.variant(resize_to_fill: [100, 100]))
  end
end
