class EconomyVagon < Vagon
  validates :places_up, :places_down, :side_places_up, :side_places_down, presence: true
end
