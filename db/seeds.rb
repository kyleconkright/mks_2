# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Order.destroy_all
User.destroy_all
Address.destroy_all

orders = Order.create(
	[
		{status: "Shipped", quantity: "1", size: "med"},
		{status: "Pending", quantity: "2", size: "lrg"},
		{status: "Shipped", quantity: "1", size: "sml"}
	]
)

users = User.create(
	[
		{name: "kyle", email: "kyle@example.com", password_digest:"password"},
		{name: "mike", email: "mike@example.com", password_digest:"password"},
		{name: "sarah", email: "sarah@example.com", password_digest:"password"}
	]
)

addresses = Address.create(
	[
		{street1: "123 Main St", city:"Beverly Hills", state:"CA", zip:"90120"},
		{street1: "934 PCH", city:"Malibu", state:"CA", zip:"90029"},
		{street1: "859 Vista St", city:"Los Angeles", state:"CA", zip:"90046"}
	]
)