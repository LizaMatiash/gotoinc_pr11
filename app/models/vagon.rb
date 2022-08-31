class Vagon < ApplicationRecord

  TYPES = %w(CoupeVagon CvVagon EconomVagon SittingVagon Vagon)

  belongs_to :train
  # enum type: [:compartment, :reserved_seat]
  validates :vagon_id, uniqueness: { scope: :train_id }

  before_validation :set_order

  private

  def set_order
    self.order_v = (Vagon.where(train_id: self.train_id).pluck(:order_v).max || 0) + 1
  end


end
