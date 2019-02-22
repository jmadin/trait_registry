json.extract! dataset, :id, :dataset_name, :doi_dataset, :doi_reference, :description, :license, :taxonomic_group, :user_id, :created_at, :updated_at
json.url dataset_url(dataset, format: :json)
