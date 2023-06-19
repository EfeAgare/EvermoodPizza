# frozen_string_literal: true

module OrdersHelper
  def format_code(code)
    code.present? ? code : '-'
  end
end
