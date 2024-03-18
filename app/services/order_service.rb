class OrderService
  def initialize(board_id:, creator_id:, first_name:, last_name:, quantity: 1, fragrance_ids:)
    @board_id = board_id
    @creator_id = creator_id
    @first_name = first_name
    @last_name = last_name
    @quantity = quantity
    @scent_profiles = Fragrance.where(id: fragrance_ids).pluck(:name)
  end

  def call
    create_order_in_monday
  end

  private

  attr_reader :board_id, :creator_id, :first_name, :last_name, :quantity, :scent_profiles

  def create_order_in_monday
    MondayApi.new.create_item(
      board_id: board_id,
      creator_id: creator_id,
      item_name: "Order: #{first_name} #{last_name} (quantity: #{quantity})",
      dropdown_values: scent_profiles
    )
  end
end
