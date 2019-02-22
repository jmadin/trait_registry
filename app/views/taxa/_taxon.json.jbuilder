json.extract! taxon, :id, :taxon_name, :taxon_guid, :dataset_id, :created_at, :updated_at
json.url taxon_url(taxon, format: :json)
