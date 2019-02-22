class Dataset < ApplicationRecord
  belongs_to :user

  has_many :traits, inverse_of: :dataset, :dependent => :destroy
  accepts_nested_attributes_for :traits, reject_if: :all_blank, allow_destroy: true

  has_many :taxa, inverse_of: :dataset, :dependent => :destroy
  accepts_nested_attributes_for :taxa, reject_if: :all_blank, allow_destroy: true
  
  validates :dataset_name, presence: true

end
