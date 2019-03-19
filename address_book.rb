require "./contact.rb"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def print_contact_list
    puts "Contact List:"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      puts contact.to_s('last_first')
        if contact.first_name.downcase.include?(search)
          results.push(contact)
        end
      end
    puts "Name search results #{name}"
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
    end
  end

end

address_book = AddressBook.new

bob = Contact.new
bob.first_name = "Bob"
bob.last_name = "Jones"
bob.add_phone_number("Home", "555-555-5555")
bob.add_phone_number("Work", "777-777-7777")
bob.add_addresses("Home", "123 Fourth St", "Apt 207", "Omaha", "NE", "68114")

joe = Contact.new
joe.first_name = "Joe"
joe.last_name = "Blow"
joe.add_phone_number("Home", "111-111-1111")
joe.add_phone_number("Work", "222-222-2222")
joe.add_addresses("Home", "111 Second St", "Apt 111", "Beverly Hills", "CA", "90210")

address_book.contacts.push(bob)
address_book.contacts.push(joe)


# address_book.print_contact_list

address_book.find_by_name("o")
