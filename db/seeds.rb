
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {name: 'Elena', alias: 'EOM', email: 'eom@example.com', password: '12345678', password_confirmation: '12345678'},
  {name: 'David', alias: 'DVC', email: 'dvc@example.com', password: '12345678', password_confirmation: '12345678'},
  {name: 'Alberto', alias: 'AGP', email: 'agp@example.com', password: '12345678', password_confirmation: '12345678'},
  {name: 'Sara', alias: 'SMA', email: 'sma@example.com', password: '12345678', password_confirmation: '12345678'},
  {name: 'Luis', alias: 'LMD', email: 'lmd@example.com', password: '12345678', password_confirmation: '12345678'},
  {name: 'Pedro', alias: 'PGM', email: 'pgm@example.com', password: '12345678', password_confirmation: '12345678'},
  {name: 'Maria', alias: 'MES', email: 'mes@example.com', password: '12345678', password_confirmation: '12345678'},
  {name: 'Laura', alias: 'LBB', email: 'lbb@example.com', password: '12345678', password_confirmation: '12345678'},
  {name: 'Ana', alias: 'AFL', email: 'afl@example.com', password: '12345678', password_confirmation: '12345678'},
  {name: 'Pablo', alias: 'PGA', email: 'pga@example.com', password: '12345678', password_confirmation: '12345678'}
])

def rosterpair (user1, user2, first_day, last_day)
	shift_num = 1	
	unless (shift_num>5)
		(first_day..last_day).each_with_index do |day, index|
			Shift.create([
				{slot: shift_num, day: day, user_id: user1},
				{slot: shift_num, day: day, user_id: user2},
				])
			if (index%2!=0)
				shift_num = shift_num +1
			end
			if (shift_num==6)
				shift_num =1
			end
		end
	end
end

rosterpair(1,2, Date.new(2016, 04, 21), Date.new(2016, 07, 10))
rosterpair(3,4, Date.new(2016, 04, 23), Date.new(2016, 07, 10))
rosterpair(5,6, Date.new(2016, 04, 25), Date.new(2016, 07, 10))
rosterpair(7,8, Date.new(2016, 04, 27), Date.new(2016, 07, 10))
rosterpair(9,10, Date.new(2016, 04, 19), Date.new(2016, 07, 10))

shifts = Shift.where(slot: 5).update_all(slot:4)

