inp = File.open(ARGV[0], 'rb') { |f| f.read }
puts RubyVM::InstructionSequence::compile(inp).disasm
