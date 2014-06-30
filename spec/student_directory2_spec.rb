require 'student_directory2'

describe  "Student Directory TDD Project" do 
	context 'print header' do
		it "prints header here" do
			header = "The students of Makers Academy\n======================================="
			expect(print_header).to eq header
		end
	end

	 context 'print_footer' do
	 	it "print footer here" do
	 		footer = "Overall, we have #{student_list.length} great students"
	 		expect(print_footer).to eq footer
		end
	end

	context 'student_list' do
		it "Create empty array" do
			expect(student_list).to eq []
		end
	end

	context 'student_name' do 
		it "ask user for student name" do 
		expect(student_name).to eq 'Alex'
		end
	end

	context 'array_iteration' do 
		it "print each name" do 
		student_list.each do |student_list| end 
		expect(array_iteration).to eq student_list
		end
	end
	context 'student_cohort' do
		it "ask student for cohort" do
			expect(ask_for_cohort).to eq "What's your cohort?"
		end

		it 'inputs a cohort' do
			month = "June\n"
			expect(self).to receive(:gets).and_return(month)
			expect(input_month).to eq 'June'
		end

		it 'knows that June is a month' do
			expect(month_exists?('june')).to be true
		end

		it 'knows that Bloom is not a month' do
			expect(month_exists?('Bloom')).not_to be true
		end

		it 'will not allow us to input the wrong month' do
			month = "blah\n"
			allow(self).to receive(:gets).and_return(month)
			expect(input_month).to eq 'You entered the wrong month name!'
		end
	end
end