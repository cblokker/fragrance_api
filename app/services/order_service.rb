class OrderService
  attr_reader :first_name, :last_name, :quantity, :fragrance_names

  def initialize(board_id:, first_name:, last_name:, quantity: 1, fragrance_ids:)
    @board_id = board_id
    @first_name = first_name
    @last_name = last_name
    @quantity = quantity
    @fragrance_names = Fragrance.where(id: fragrance_ids).pluck(:name)
  end

  def call
    create_order_in_monday
  end

  private

  def create_order_in_monday
    MondayAPI.create_item(board_id:, first_name:, last_name:, quantity:, fragrance_names:)
  end
end