module UsersHelper
  def format_balance(balance)
    color = balance < 0 ? "red" : "green"
    content_tag :span, number_to_currency(balance), :class => color
  end
end
