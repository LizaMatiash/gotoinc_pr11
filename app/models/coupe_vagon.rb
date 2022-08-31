class CoupeVagon < Vagon
  validates :places_up, :places_down, presence: true
end
