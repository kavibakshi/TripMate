# this user model has the following fields in the database:
# - email:string
# - password_digest:string
# 
# the command 'has_secure_password' also adds the virtual attributes:
# - password:string (virtual)
# - password_confirmation:string (virtual)
#
# essentially, this means that we will never set with the password_digest field ourselves,
# the two virtual attributes will deal with it internally

class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Input in the email field must be a valid email address."}
    validates :email, uniqueness: { message: "You already have an account" }
end
