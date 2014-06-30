require 'date'

def print_header
	"The students of Makers Academy\n======================================="
end

def print_footer
	"Overall, we have #{student_list.length} great students"
end

def student_list
	[]
end

def student_name
	'Alex'
end

def array_iteration
	p student_list
end

def ask_for_cohort
	"What's your cohort?"
end

def input_month
	month = gets.chomp
	return 'You entered the wrong month name!' unless month_exists?(month)
	month
end

def month_exists?(month)
	Date::MONTHNAMES.include?(month.downcase.capitalize)
end