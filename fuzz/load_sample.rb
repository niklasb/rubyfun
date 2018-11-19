inp = File.open(ARGV[0], 'rb') { |f| f.read }
begin
  RubyVM::InstructionSequence::load_from_binary(inp)
rescue
end
GC.start
