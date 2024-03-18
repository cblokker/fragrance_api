class OrderService
  attr_reader :first_name, :last_name, :quantity, :scent_profiles

  def initialize(board_id:, first_name:, last_name:, quantity: 1, fragrance_ids:, sales_associate:)
    @board_id = board_id
    @first_name = first_name
    @last_name = last_name
    @quantity = quantity
    @sales_associate = sales_associate
    @scent_profiles = Fragrance.where(id: fragrance_ids).pluck(:name)
  end

  def call
    create_order_in_monday
  end

  private

  def create_order_in_monday
    MondayApi.create_item(board_id, {first_name:, last_name:, quantity:, sales_associate:, scent_profiles:})
  end
end
