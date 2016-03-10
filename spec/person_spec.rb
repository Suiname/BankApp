require_relative '../app/person'

describe Person do
  let(:person) { Person.new('John', 'Doe') }
  describe '#firstname' do
    it 'has first name of John' do
      expect(person.firstname).to eq 'John'
    end
  end

  describe '#lastname' do
    it 'has last name of Doe' do
      expect(person.lastname).to eq 'Doe'
    end
  end
end
