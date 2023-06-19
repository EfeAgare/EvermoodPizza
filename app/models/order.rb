class Order < ApplicationRecord

  enum state: {
    OPEN: 0,
    COMPLETED: 1
  }
end
