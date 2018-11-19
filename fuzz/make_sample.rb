inp = File.open(ARGV[0], 'rb') { |f| f.read }
bin = RubyVM::InstructionSequence::compile(inp).to_binary
File.open(ARGV[1], 'wb') { |f| f.write(bin) }
