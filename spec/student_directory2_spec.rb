require 'student_directory2'

describe  "Student Directory TDD Project" do 
	context 'print information' do
		it "prints header here" do
			header = "The students of Makers Academy\n======================================="
			expect(print_header).to eq header
		end
	
	 	it "print footer here" do
	 		footer = "Overall, we have #{student_list.length} great students"
	 		expect(print_footer).to eq footer
		end

	end
	context 'interactive menu' do 
		it 'print interactive menu' do 
			choice = "1\n"  
			allow(self).to receive(:puts).with "1. Input the students\n2. Show the students\n3. Save the list to students.csv\n4. Load the list from students.csv\n9. Exit"
			expect(self).to receive(:gets).and_return(choice)
			expect(interactive_menu).to eq "1"
		end

		it 'knows that 1 is a number' do 
			expect(number_exists?("1")).to be_truthy
		end

		it 'knows that "p" is not a number' do 
			expect(number_exists?("p")).to eq nil
		end

		it 'when user inputs 1' do  
			expect(self).to receive(:student_name)
			expect(self).to receive(:student_hobby)
			expect(self).to receive(:student_cohort)
			ask_all_questions
		end

		it 'when user inputs 9' do 
			expect(self).to receive(:exit)
			end_programme
		end
	end

	context 'adding and taking students' do
		it "has no students" do
			expect(student_list).to eq []
		end

		it "adds a student" do 
			student = {:name => "David", :cohort => :June, :hobby => "running"}
			add(student)
			expect(student_list).to eq [student]
		end

		it 'takes a student' do 
			student = {name: "David", cohort: :June, :hobby => "running"}
			expect(student_to_s(student)).to eq 'David who likes running in the June cohort' 
		end

		it "print each name" do 
			%w{David Chloe Zoe}.each do |name|
				add({name: name, cohort: :June, hobby: "running"})
			end
			expect(list_of_students).to eq("1. David who likes running in the June cohort\n2. Chloe who likes running in the June cohort\n3. Zoe who likes running in the June cohort")
			print_students
		end
	end

	context 'ask user for input' do 

		it "ask user for student name" do 
			name = "David\n"
			expect(self).to receive(:puts).with("What's your name?")
			expect(self).to receive(:gets).and_return(name)
			expect(student_name).to eq 'David'
		end

		it "ask user for hobby" do
			hobby = "Running\n"
			expect(self).to receive(:puts).with("What's your hobby?")
			expect(self).to receive(:gets).and_return(hobby)
			expect(student_hobby).to eq 'Running'
		end

		it 'inputs a cohort' do
			month = "June\n"
			expect(self).to receive(:puts).with("What's your cohort?")
			expect(self).to receive(:gets).and_return(month)
			expect(student_cohort).to eq 'June'
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
			expect(student_cohort).to eq 'You entered the wrong month name!'
		end
	end

	context 'outputting everything' do 
		it 'outputs everything' do 
			%w{David Chloe Zoe}.each do |name|
				add({name: name, cohort: :June, hobby: "running"})
			end
			expect(self).to receive(:print_header)
			expect(self).to receive(:print_students)
			expect(self).to receive(:print_footer)
			print_everything
		end
	end
end