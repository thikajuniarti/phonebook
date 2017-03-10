class Book < ApplicationRecord

  belongs_to :user, optional: true

  validates :name, presence: true, length: { minimum: 5}, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  validates :number, presence: true, numericality: { only_integer: true, message: "without a symbol (+-?><!@#,)" }
end
