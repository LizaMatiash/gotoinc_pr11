class Vagon < ApplicationRecord

  belongs_to :train
  enum type_v: [:compartment, :reserved_seat]
end
